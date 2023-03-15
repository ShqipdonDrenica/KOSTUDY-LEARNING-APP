import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_study_app/controllers/quiz_paper_controller.dart';
import 'package:flutter_study_app/firebase_ref/loading_status.dart';
import 'package:flutter_study_app/firebase_ref/references.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:flutter_study_app/screens/home/home_screen.dart';
import 'package:flutter_study_app/screens/home/user_home_screen.dart';
import 'package:flutter_study_app/screens/result_screen.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  var loadingStatus = LoadingStatus.loading.obs;
  QuestionPaperModel? questionPaperModel;

  final questionIndex = 0.obs;
  final allQuestions = <Questions>[];

  bool get isLastQuestion => questionIndex.value >= allQuestions.length - 1;
  bool get isFirstQuestion => questionIndex > 0;

  void jumpToQuestion(int index, {bool isGoBack = true}) {
    questionIndex.value = index;
    currentQuestion.value = allQuestions[index];
    if (isGoBack) {
      Get.back();
    }
  }

  void tryAgain() {
    Get.find<QuizPaperController>()
        .navigateToQuestions(paper: questionPaperModel!, tryAgain: true);
  }

  // ignore: non_constant_identifier_names
  void Complete() {
    _timer!.cancel();
    Get.to(() => ResultScreen());
  }

  String get completedTest {
    final answered = allQuestions
        .where((element) => element.selectedAnswer != null)
        .toList()
        .length;
    return '$answered nga ${allQuestions.length} je përgjigjur';
  }

  //restart in the begining
  navigateToHome() async {
    _timer!.cancel();
    User? user = Get.find<AuthController>().getUser();

    // Get the user's role from Firebase
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.email)
        .get();
    Map<dynamic, dynamic> userData = userDoc.data() as Map<dynamic,
        dynamic>; // Cast the return value of data() to Map<String, dynamic>
    int userRole = userData["role"]
        as int; // Access the "role" field using the [] operator and cast the value to int

    if (userRole == 1) {
      return Get.offAll(() => HomeScreen());
    } else {
      return Get.offAll(() => UserHomeScreen());
    }
  }

  Rxn<Questions> currentQuestion = Rxn<Questions>();

  Timer? _timer;
  int remainSeconds = 1;
  final time = '00.00'.obs;

  Future<void> loadData(QuestionPaperModel questionPaper) async {
    questionPaperModel = questionPaper;
    loadingStatus.value = LoadingStatus.loading;
    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery =
          await questionPaperRF
              .doc(questionPaper.id)
              .collection("questions")
              .get();

      //create a list
      final questions = questionQuery.docs
          .map((snapshot) => Questions.fromSnapshot(snapshot))
          .toList();
      questionPaper.questions = questions;
      for (Questions question in questionPaper.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answerQuery =
            await questionPaperRF
                .doc(questionPaper.id)
                .collection("questions")
                .doc(question.id)
                // ToDo: Kisha pas harru mja qit ni s nfund dmth e kom pas answer u dasht mu kan answers hahhahaha
                .collection("answers")
                .get();
        final answers = answerQuery.docs
            .map((answer) => Answers.fromSnapshot(answer))
            .toList();
        question.answers = answers;

        //get all the collections

      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    if (questionPaper.questions != null &&
        questionPaper.questions!.isNotEmpty) {
      allQuestions.assignAll(questionPaper.questions!);
      currentQuestion.value = questionPaper.questions![0];
      _startTimer(questionPaper.timeSeconds!);

      if (kDebugMode) {
        print(questionPaper.questions![0].question);
      }
      loadingStatus.value = LoadingStatus.completed;
    } else {
      loadingStatus.value = LoadingStatus.error;
    }
  }

  void nextQuestion() {
    if (questionIndex.value >= allQuestions.length - 1) {
      return;
    }
    questionIndex.value++;
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  void selectedAnswer(String? answer) {
    currentQuestion.value!.selectedAnswer = answer;
    update(['answer_list', 'answer_review_list']);
  }

  void prevQuestion() {
    if (questionIndex.value <= 0) return;

    questionIndex.value--;
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainSeconds == 0) {
        timer.cancel();
      } else {
        int minutes = remainSeconds ~/ 60;
        int seconds = remainSeconds % 60;
        time.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainSeconds--;
      }
    });
  }

  @override
  void onReady() {
    final questionPaper = Get.arguments;
    if (questionPaper != null && questionPaper is QuestionPaperModel) {
      if (kDebugMode) {
        print(questionPaper.id);
      }
      loadData(questionPaper);
    } else {
      // Handle the case where the argument is null or not a QuestionPaperModel
    }
    super.onReady();
  }
}
