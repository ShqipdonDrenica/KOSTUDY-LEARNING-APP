import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_study_app/controllers/question_papers/question_controller.dart';
import 'package:flutter_study_app/firebase_ref/references.dart';
import 'package:get/get.dart';

extension QuestionExtensionController on QuestionController {
  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  String correctAnswerQuestion() {
    return '$correctQuestionCount nga ${allQuestions.length} janë të sakta';
  }

  String achivement() {
    if (correctQuestionCount <= 2) {
      return 'Rezultati eshte i dobet';
    }
    if (correctQuestionCount == 3) {
      return 'Rezultati eshte i mire';
    } else {
      return 'Rezultati eshte shume i mire';
    }
  }

  Color achivementt() {
    if (correctQuestionCount <= 2) {
      return Colors.red;
    }
    if (correctQuestionCount == 3) {
      return Colors.orange;
    } else {
      return Colors.yellow;
    }
  }

  Future<void> saveTestResults() async {
    var batch = fireStore.batch();
    User? user = Get.find<AuthController>().getUser();
    if (user == null) return;
    batch.set(
        userRF
            .doc(user.email)
            .collection('myrecent_tests')
            .doc(questionPaperModel.id),
        {
          "points": points(),
          "correct_answer": '$correctQuestionCount/${allQuestions.length}',
          "question_id": questionPaperModel.id,
          "time": questionPaperModel.timeSeconds - remainSeconds
        });
    await batch.commit();
    await navigateToHome();
  }

  points() {
    var points = (correctQuestionCount / allQuestions.length) *
        100 *
        (questionPaperModel.timeSeconds - remainSeconds) /
        questionPaperModel.timeSeconds *
        100;
    return points.toStringAsFixed(2);
  }
}
