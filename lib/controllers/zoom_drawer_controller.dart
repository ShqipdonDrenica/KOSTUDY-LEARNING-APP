import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_study_app/controllers/create_quiz_controller.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDraweController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  CreateQuizController createQuizController =
      Get.put<CreateQuizController>(CreateQuizController());
  final controller = Get.put<AuthController>(AuthController());
  final user = Rxn<User>();
  late final FirebaseAuth _auth = FirebaseAuth.instance;
  void toogleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void website() {
    _launch("https://www.ubt-uni.net/");
  }

  void facebook() {
    _launch("https://www.facebook.com/profile.php?id=100005759825086");
  }

  void email() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'sd45762@ubt-uni.net',
    );
    _launch(emailLaunchUri.toString());
  }

  Future<void> _launch(String url) async {
    // ignore: deprecated_member_use
    if (!await launch(url)) {
      throw ' could not laucn $url';
    }
  }

  User? getUser() {
    user.value = _auth.currentUser;
    return user.value;
  }

  @override
  void onReady() {
    getUser();
    super.onReady();
  }
}
