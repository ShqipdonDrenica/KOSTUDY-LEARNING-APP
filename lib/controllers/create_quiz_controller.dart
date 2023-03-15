import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:flutter_study_app/screens/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateQuizController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;
  var fireStore = FirebaseFirestore.instance;
  RegExp nrRegExp = RegExp(r'^[0-9]+$');

  final createQuizFormKey = GlobalKey<FormState>().obs;
  final createQuestion1FormKey = GlobalKey<FormState>().obs;
  final createQuestion2FormKey = GlobalKey<FormState>().obs;
  final createQuestion3FormKey = GlobalKey<FormState>().obs;
  final createQuestion4FormKey = GlobalKey<FormState>().obs;
  final createQuestion5FormKey = GlobalKey<FormState>().obs;

  var allQuizPaperCreated = false.obs;

  var createdQuiz = false.obs;

  var firstQuestionCreated = false.obs;
  var secondQuestionCreated = false.obs;
  var thirdQuestionCreated = false.obs;
  var fourthQuestionCreated = false.obs;
  var fifthQuestionCreated = false.obs;

  static QuestionPaperModel? question;

  //controllers for quiz
  var titleQuizController = TextEditingController().obs;
  var descriptionQuizController = TextEditingController().obs;
  var idQuizController = TextEditingController().obs;
  var imageQuizController = TextEditingController().obs;
  var numberOfQuestionController = TextEditingController().obs;
  var timeQuizController = TextEditingController().obs;

  var idOfQuiz = 0.obs;
  var idOfQuestion = 2.obs;
  static const String prefStringID = "idS";
  //controllers for questions
  var firstQuestionController = TextEditingController().obs;
  var secondQuestionController = TextEditingController().obs;
  var thirdQuestionController = TextEditingController().obs;
  var fourthQuestionController = TextEditingController().obs;
  var fifthQuestionController = TextEditingController().obs;

  //controllers for correctAnswers
  var firstCorrectAnswer = TextEditingController().obs;
  var secondCorrectAnswer = TextEditingController().obs;
  var thirdCorrectAnswer = TextEditingController().obs;
  var fourthCorrectAnswer = TextEditingController().obs;
  var fifthCorrectAnswer = TextEditingController().obs;

  //controllers for answers
  var firstAnswerControllerA = TextEditingController().obs;
  var firstAnswerControllerB = TextEditingController().obs;
  var firstAnswerControllerC = TextEditingController().obs;
  var firstAnswerControllerD = TextEditingController().obs;

  var secondAnswerControllerA = TextEditingController().obs;
  var secondAnswerControllerB = TextEditingController().obs;
  var secondAnswerControllerC = TextEditingController().obs;
  var secondAnswerControllerD = TextEditingController().obs;

  var thirdAnswerControllerA = TextEditingController().obs;
  var thirdAnswerControllerB = TextEditingController().obs;
  var thirdAnswerControllerC = TextEditingController().obs;
  var thirdAnswerControllerD = TextEditingController().obs;

  var fourthAnswerControllerA = TextEditingController().obs;
  var fourthAnswerControllerB = TextEditingController().obs;
  var fourthAnswerControllerC = TextEditingController().obs;
  var fourthAnswerControllerD = TextEditingController().obs;

  var fifthAnswerControllerA = TextEditingController().obs;
  var fifthAnswerControllerB = TextEditingController().obs;
  var fifthAnswerControllerC = TextEditingController().obs;
  var fifthAnswerControllerD = TextEditingController().obs;

  Rx<User?> useri = Rxn();

  // bool isAdmin() {
  //   return user.role == role.admin;
  // }

  // bool isModerator() {
  //   return user?.role == roleType.moderator;
  // }

  // bool isUser() {
  //   return user?.role == roleType.user;
  // }

  // bool isAdmin() {
  //   return user?.role == roleType.admin;
  // }

  // bool isModerator() {
  //   return user?.role == roleType.moderator;
  // }

  // bool isUser() {
  //   return user?.role == roleType.user;
  // }

  navigateToHomePage() {
    Get.to(() => HomeScreen());
    titleQuizController.value.text = '';
    descriptionQuizController.value.text = '';
    idQuizController.value.text = '';
    imageQuizController.value.text = '';
    numberOfQuestionController.value.text = '';
    timeQuizController.value.text = '';
  }

  void saveQuestionId() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(prefStringID, idOfQuestion.value);
  }

  void getCurrentQuestionIndex() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(prefStringID)) {
      final index = prefs.getInt(prefStringID);
      if (index != null) {
        idOfQuestion.value = index;
      }
    }
  }

  void saveID() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(prefStringID, idOfQuiz.value);
  }

  void getCurrentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(prefStringID)) {
      final index = prefs.getInt(prefStringID);
      if (index != null) {
        idOfQuiz.value = index;
      }
    }
  }

  Future createAnswerA(
      {required String answer, required String identifier}) async {
    final collAnswers = FirebaseFirestore.instance
        .collection('questionPapers')
        .doc(idOfQuiz.toString())
        .collection('questions')
        .doc(idOfQuestion.toString())
        .collection('answers')
        .doc(firstAnswerControllerA == firstAnswerControllerA
            ? 'A'
            : secondAnswerControllerA == secondAnswerControllerA
                ? 'A'
                : thirdAnswerControllerA == thirdAnswerControllerA
                    ? 'A'
                    : fourthAnswerControllerA == fourthAnswerControllerA
                        ? 'A'
                        : fifthAnswerControllerA == fifthAnswerControllerA
                            ? 'A'
                            : 'x');
    final json = {
      'answer': answer,
      'identifier': identifier,
    };
    await collAnswers.set(json);
  }

  Future createAnswerB(
      {required String answer, required String identifier}) async {
    final collAnswers = FirebaseFirestore.instance
        .collection('questionPapers')
        .doc(idOfQuiz.toString())
        .collection('questions')
        .doc(idOfQuestion.toString())
        .collection('answers')
        .doc(firstAnswerControllerB == firstAnswerControllerB
            ? 'B'
            : secondAnswerControllerB == secondAnswerControllerB
                ? 'B'
                : thirdAnswerControllerB == thirdAnswerControllerB
                    ? 'B'
                    : fourthAnswerControllerB == fourthAnswerControllerB
                        ? 'B'
                        : fifthAnswerControllerB == fifthAnswerControllerB
                            ? 'B'
                            : 'x');
    final json = {
      'answer': answer,
      'identifier': identifier,
    };
    await collAnswers.set(json);
  }

  Future createAnswerC(
      {required String answer, required String identifier}) async {
    final collAnswers = FirebaseFirestore.instance
        .collection('questionPapers')
        .doc(idOfQuiz.toString())
        .collection('questions')
        .doc(idOfQuestion.toString())
        .collection('answers')
        .doc(firstAnswerControllerC == firstAnswerControllerC
            ? 'C'
            : secondAnswerControllerC == secondAnswerControllerC
                ? 'C'
                : thirdAnswerControllerC == thirdAnswerControllerC
                    ? 'C'
                    : fourthAnswerControllerC == fourthAnswerControllerC
                        ? 'C'
                        : fifthAnswerControllerC == fifthAnswerControllerC
                            ? 'C'
                            : 'x');
    final json = {
      'answer': answer,
      'identifier': identifier,
    };
    await collAnswers.set(json);
  }

  Future createAnswerD(
      {required String answer, required String identifier}) async {
    final collAnswers = FirebaseFirestore.instance
        .collection('questionPapers')
        .doc(idOfQuiz.toString())
        .collection('questions')
        .doc(idOfQuestion.toString())
        .collection('answers')
        .doc(firstAnswerControllerD == firstAnswerControllerD
            ? 'D'
            : secondAnswerControllerD == secondAnswerControllerD
                ? 'D'
                : thirdAnswerControllerD == thirdAnswerControllerD
                    ? 'D'
                    : fourthAnswerControllerD == fourthAnswerControllerD
                        ? 'D'
                        : fifthAnswerControllerD == fifthAnswerControllerD
                            ? 'D'
                            : 'x');
    final json = {
      'answer': answer,
      'identifier': identifier,
    };
    await collAnswers.set(json);
  }

  Future createQuestion({
    required String id,
    required String question,
    required String correctAnswer,
  }) async {
    final collQuestion = FirebaseFirestore.instance
        .collection('questionPapers')
        .doc(idOfQuiz.toString())
        .collection('questions')
        .doc(idOfQuestion.toString());

    final json = {'correct_answer': correctAnswer, 'question': question};
    await collQuestion.set(json);
  }

  Future createQuiz(
      {required String title,
      required String description,
      required String id,
      required String imageUrl,
      required int questionCount,
      required int timeSeconds}) async {
    //Reference to document
    final docQuiz =
        FirebaseFirestore.instance.collection('questionPapers').doc(id);

    final json = {
      'title': title,
      'description': description,
      'id': id,
      'image_url': imageUrl,
      'question_count': questionCount,
      'time_seconds': timeSeconds
    };
    await docQuiz.set(json);
  }

  // Future editQuiz({required String docId}) async {
  //   final docQuiz =
  //       FirebaseFirestore.instance.collection('questionPapers').doc(docId);
  // }

  Future<void> submit() async {
    if (!createQuizFormKey.value.currentState!.validate()) {
      return;
    }
    createQuizFormKey.value.currentState!.save();
    createdQuiz.value = true;
  }

  Future<void> submitQuestion1() async {
    if (!createQuestion1FormKey.value.currentState!.validate()) {
      return;
    }
    createQuestion1FormKey.value.currentState!.save();
    firstQuestionCreated.value = true;
  }

  Future<void> submitQuestion2() async {
    if (!createQuestion2FormKey.value.currentState!.validate()) {
      return;
    }
    createQuestion2FormKey.value.currentState!.save();
    secondQuestionCreated.value = true;
  }

  Future<void> submitQuestion3() async {
    if (!createQuestion3FormKey.value.currentState!.validate()) {
      return;
    }
    createQuestion3FormKey.value.currentState!.save();
    thirdQuestionCreated.value = true;
  }

  Future<void> submitQuestion4() async {
    if (!createQuestion4FormKey.value.currentState!.validate()) {
      return;
    }
    createQuestion4FormKey.value.currentState!.save();
    fourthQuestionCreated.value = true;
  }

  Future<void> submitQuestion5() async {
    if (!createQuestion5FormKey.value.currentState!.validate()) {
      return;
    }
    createQuestion5FormKey.value.currentState!.save();
    fifthQuestionCreated.value = true;
  }

  // Future<void> getUserRole({required String email}) async {
  //   final FirebaseFirestore _db = FirebaseFirestore.instance;
  //   var snapshot =
  //       await _db.collection("users").where("email", isEqualTo: email).get();

  //   int role = snapshot.docs.first.data()['role'];
  //   print(role);
  // }
  Future<int?> getUserRole(String? email) async {
    if (email == null) return null;
    final FirebaseFirestore db = FirebaseFirestore.instance;
    var snapshot =
        await db.collection("users").where("email", isEqualTo: email).get();
    if (snapshot.docs.isEmpty) return null;
    int role = snapshot.docs.first.data()['role'];
    return role;
  }

  // getRole() async {
  //   int _role;
  //   final QuerySnapshot result = await FirebaseFirestore.instance
  //       .collection('users')
  //       .where('email', isEqualTo: 'shqipdondrenica@gmail.com')
  //       .get();
  //   final List<DocumentSnapshot> documents = result.docs;
  //   if (documents.length == 1) {
  //     final int role = documents[0].data()['role'];

  //     _role = role;
  //   }
  // }

  @override
  void onInit() async {
    getCurrentIndex();
    getCurrentQuestionIndex();
    // getRole();
    super.onInit();
  }
}
