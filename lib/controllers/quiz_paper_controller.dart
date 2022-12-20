import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_study_app/firebase_ref/references.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:flutter_study_app/screens/questions/questions_screen.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;
  var fireStore = FirebaseFirestore.instance;

  static QuestionPaperModel? question;

  //controllers for quiz
  var titleQuizController = TextEditingController(text: question?.title).obs;
  var descriptionQuizController = TextEditingController().obs;
  var idQuizController = TextEditingController().obs;
  var imageQuizController = TextEditingController().obs;
  var numberOfQuestionController = TextEditingController().obs;
  var timeQuizController = TextEditingController().obs;

  var idOfQuiz = 0.obs;
  var idOfQuestion = 0.obs;
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

  // var idOfQuizController = TextEditingController().obs;

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

  Future deleteQuiz({required String docId}) async {
    final docQuiz =
        FirebaseFirestore.instance.collection('questionPapers').doc(docId);
    await docQuiz.delete();
  }

  Future editQuiz({required String docId}) async {
    final docQuiz =
        FirebaseFirestore.instance.collection('questionPapers').doc(docId);
  }

  Stream<List<QuestionPaperModel>> getAllPapersService() {
    // List<String> imgName = ["biology", "chemistry", "maths", "physics"];
    //pass image
    //     for (var img in imgName) {
    //   final imgUrl = await Get.put(FirebaseStorageService()).getImage(img);
    //   allPaperImages.add(imgUrl!);
    // }
    // try {
    return fireStore
        .collection('questionPapers')
        .snapshots()
        .map((QuerySnapshot query) {
      final List<QuestionPaperModel> questionList = [];
      for (final subject in query.docs) {
        final questionModel =
            QuestionPaperModel.fromDocumentSnapshot(json: subject);
        questionList.add(questionModel);
      }
      // employees.sort(
      //   (a, b) => a..toLowerCase().compareTo(b.fullName.toLowerCase()),
      // );
      return questionList;
    });

    // QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
    // final paperList = data.docs
    //     .map((paper) => QuestionPaperModel.fromSnapshot(paper))
    //     .toList();
    // for (var paper in paperList) {
    //   final imageUrl =
    //       await Get.put(FirebaseStorageService()).getImage(paper.title);
    //   paper.imageUrl = imageUrl;
    //   print(imageUrl);
    // }
    //if exists a paper this not duplicate this
    // allPapers.assignAll(paperList);
    // return allPapers;
    // } catch (e) {
    //   print(e);
    // }
  }

  // getQuestionPerSubject({required String docId}) async {
  //   try {
  //     var result = await fireStore
  //         .collection('questionPapers')
  //         .doc(docId)
  //         .collection('questions')
  //         .get();
  //     // ignore: empty_catches
  //   } catch (e) {}
  // }

  navigateToQuestions(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController authController = Get.put<AuthController>(AuthController());
    if (authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        //Get.offNameed
        Get.toNamed(QuestionsScreen.routeName,
            arguments: paper, preventDuplicates: false);
      } else {
        Get.toNamed(QuestionsScreen.routeName, arguments: paper);
        //Get.toNamed
      }
    } else {
      if (kDebugMode) {
        print('The title is ${paper.title}');
      }
      return authController.showLoginAlertDialog();
    }
  }

  @override
  void onInit() async {
    allPapers.bindStream(getAllPapersService());
    getCurrentIndex();
    getCurrentQuestionIndex();
    super.onInit();
  }
}
