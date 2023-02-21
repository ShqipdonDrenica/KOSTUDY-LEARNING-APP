import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_study_app/firebase_ref/references.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:flutter_study_app/screens/home/home_screen.dart';
import 'package:flutter_study_app/screens/login/login_screen.dart';
import 'package:flutter_study_app/widgets/dialogs/dialog_widget.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/home/user_home_screen.dart';

class AuthController extends GetxController {
  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  Future<int?> checkRole() async {
    DocumentSnapshot userDoc =
        await fireStore.collection("users").doc(_user.value!.email).get();
    UserModel userModel =
        UserModel.fromJson(userDoc.data as Map<String, dynamic>);
    if (userModel.role == 1) {
      if (kDebugMode) {
        print('Admin');
      }
    } else if (userModel.role == 0) {
      if (kDebugMode) {
        print('Super admin');
      }
    }
    return null;
  }

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    //saved changes or not in this variable
    _authStateChanges = _auth.authStateChanges();
    //listen the user changes
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIntroduction();
  }

  signInWithGoogle() async {
    //Trigger the authentication flow
    final GoogleSignInAccount? account =
        await GoogleSignIn(scopes: <String>["Email"]).signIn();

    //obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await account!.authentication;

    //Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //once signed in, return the UserCredential
    try {
      //once signed in, return the UserCredential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user!.email == "shqipdondrenica@gmail.com") {
        await saveUser(account, 1);
        navigateToHomePage();
      } else {
        await saveUser(account, 0);
        navigateToUserHomePage();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error signing in with Google: $e");
      }
      // Handle the error here
    }

    // final GoogleSignIn _googleSignIn = GoogleSignIn();
    // try {
    //   GoogleSignInAccount? account = await _googleSignIn.signIn();
    //   if (account != null) {
    //     final _authAccount = await account.authentication;

    //     final _credential = GoogleAuthProvider.credential(
    //         idToken: _authAccount.idToken,
    //         accessToken: _authAccount.accessToken);
    //     await _auth.signInWithCredential(_credential);
    //     await saveUser(account);
    //   }
    // } on Exception catch (error) {
    //   print(error);
    // }
  }

  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  Future<void> saveUser(GoogleSignInAccount account, int role) async {
    final collectionRef = FirebaseFirestore.instance.collection('users');
    final docRef = collectionRef.doc(account.email);

    await docRef.set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl,
      "role": role,
    });
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      navigateToIntroduction();
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  navigateToHomePage() {
    Get.offAllNamed(HomeScreen.routeName);
  }

  navigateToUserHomePage() {
    Get.to(UserHomeScreen());
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }

  showLoginAlertDialog() {
    return Get.dialog(
        Dialogs.questionStartDialog(
            onTap: () {
              Get.back();
              navigateToLoginPage();
            },
            description: 'Ju duhet te kyqeni per filluar kuizin',
            title: 'Pershendetje...'),
        barrierDismissible: true);
  }

  void navigateToLoginPage() {
    Get.toNamed(LoginScreen.routeName);
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  @override
  void onReady() {
    initAuth();
    super.onReady();
  }
}
