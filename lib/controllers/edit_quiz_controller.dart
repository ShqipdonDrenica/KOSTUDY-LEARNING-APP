import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_study_app/controllers/quiz_paper_controller.dart';
import 'package:flutter_study_app/firebase_ref/references.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:get/get.dart';

class EditQuizController extends GetxController {
  // final allPapers = <QuestionPaperModel>[].obs;
  var fireStore = FirebaseFirestore.instance;

  static final quizPaperController = Get.find<QuizPaperController>();

  static QuestionPaperModel? quiz;
  // static List<Questions>? questions;

  //controllers for quiz
  var titleQuizController = TextEditingController(text: quiz?.title).obs;
  var descriptionQuizController =
      TextEditingController(text: quiz?.description).obs;
  var imageQuizController = TextEditingController(text: quiz?.imageUrl).obs;
  var timeQuizController =
      TextEditingController(text: quiz?.timeSeconds.toString()).obs;

  var idOfQuiz = 0.obs;
  var idOfQuestion = 0.obs;
  static const String prefStringID = "idS";

  //controllers for questions
  var firstQuestionController =
      TextEditingController(text: quiz?.questions?[0].question).obs;
  var secondQuestionController =
      TextEditingController(text: quiz?.questions?[1].question).obs;
  var thirdQuestionController =
      TextEditingController(text: quiz?.questions?[2].question).obs;
  var fourthQuestionController =
      TextEditingController(text: quiz?.questions?[3].question).obs;
  var fifthQuestionController =
      TextEditingController(text: quiz?.questions?[4].question).obs;

  //controllers for correctAnswers
  var firstCorrectAnswerController =
      TextEditingController(text: quiz?.questions?[0].correctAnswer).obs;
  var secondCorrectAnswerController =
      TextEditingController(text: quiz?.questions?[1].correctAnswer).obs;
  var thirdCorrectAnswerController =
      TextEditingController(text: quiz?.questions?[2].correctAnswer).obs;
  var fourthCorrectAnswerController =
      TextEditingController(text: quiz?.questions?[3].correctAnswer).obs;
  var fifthCorrectAnswerController =
      TextEditingController(text: quiz?.questions?[4].correctAnswer).obs;

  //controllers for answers
  var firstAnswerControllerA =
      TextEditingController(text: quiz?.questions?[0].answers?[0].answer).obs;
  var firstAnswerControllerB =
      TextEditingController(text: quiz?.questions?[0].answers?[1].answer).obs;
  var firstAnswerControllerC =
      TextEditingController(text: quiz?.questions?[0].answers?[2].answer).obs;
  var firstAnswerControllerD =
      TextEditingController(text: quiz?.questions?[0].answers?[3].answer).obs;

  var secondAnswerControllerA =
      TextEditingController(text: quiz?.questions?[1].answers?[0].answer).obs;
  var secondAnswerControllerB =
      TextEditingController(text: quiz?.questions?[1].answers?[1].answer).obs;
  var secondAnswerControllerC =
      TextEditingController(text: quiz?.questions?[1].answers?[2].answer).obs;
  var secondAnswerControllerD =
      TextEditingController(text: quiz?.questions?[1].answers?[3].answer).obs;

  var thirdAnswerControllerA =
      TextEditingController(text: quiz?.questions?[2].answers?[0].answer).obs;
  var thirdAnswerControllerB =
      TextEditingController(text: quiz?.questions?[2].answers?[1].answer).obs;
  var thirdAnswerControllerC =
      TextEditingController(text: quiz?.questions?[2].answers?[2].answer).obs;
  var thirdAnswerControllerD =
      TextEditingController(text: quiz?.questions?[2].answers?[3].answer).obs;

  var fourthAnswerControllerA =
      TextEditingController(text: quiz?.questions?[3].answers?[0].answer).obs;
  var fourthAnswerControllerB =
      TextEditingController(text: quiz?.questions?[3].answers?[1].answer).obs;
  var fourthAnswerControllerC =
      TextEditingController(text: quiz?.questions?[3].answers?[2].answer).obs;
  var fourthAnswerControllerD =
      TextEditingController(text: quiz?.questions?[3].answers?[3].answer).obs;

  var fifthAnswerControllerA =
      TextEditingController(text: quiz?.questions?[4].answers?[0].answer).obs;
  var fifthAnswerControllerB =
      TextEditingController(text: quiz?.questions?[4].answers?[1].answer).obs;
  var fifthAnswerControllerC =
      TextEditingController(text: quiz?.questions?[4].answers?[2].answer).obs;
  var fifthAnswerControllerD =
      TextEditingController(text: quiz?.questions?[4].answers?[3].answer).obs;

  Future updateQuiz() async {
    final docQuiz =
        FirebaseFirestore.instance.collection('questionPapers').doc(quiz!.id);

    final json = {
      'title': titleQuizController.value.text,
      'description': descriptionQuizController.value.text,
      'id': quiz!.id,
      'image_url': imageQuizController.value.text,
      'question_count': 5,
      'time_seconds': timeQuizController.value.text
    };
    await docQuiz.update(json);
  }

  Future updateQuestion(
      {required String question,
      required String correctAnswer,
      required int index}) async {
    final collQuestion = FirebaseFirestore.instance
        .collection('questionPapers')
        .doc(quiz?.id)
        .collection('questions')
        .doc(quiz?.questions?[index].id);

    final json = {'correct_answer': correctAnswer, 'question': question};
    await collQuestion.update(json);
  }

  Future updateAnswerA({required String answer, required int index}) async {
    final collAnswers = FirebaseFirestore.instance
        .collection('questionPapers')
        .doc(quiz?.id)
        .collection('questions')
        .doc(quiz?.questions?[index].id)
        .collection('answers')
        .doc('A');
    final json = {
      'answer': answer,
      'identifier': 'A',
    };
    await collAnswers.update(json);
  }

  Future updateAnswerB({required String answer, required int index}) async {
    final collAnswers = FirebaseFirestore.instance
        .collection('questionPapers')
        .doc(quiz?.id)
        .collection('questions')
        .doc(quiz?.questions?[index].id)
        .collection('answers')
        .doc('B');
    final json = {
      'answer': answer,
      'identifier': 'B',
    };
    await collAnswers.update(json);
  }

  static Future deleteQuiz({required String docId}) async {
    await FirebaseFirestore.instance
        .collection('questionPapers')
        .doc(docId)
        .collection('questions')
        .get()
        .then((snapshot) async {
      for (DocumentSnapshot ds in snapshot.docs) {
        await ds.reference.delete();
      }
    });

    await FirebaseFirestore.instance
        .collection('questionPapers')
        .doc(docId)
        .delete();

    // await docQuiz;
  }

  Future updateAnswerC({required String answer, required int index}) async {
    final collAnswers = FirebaseFirestore.instance
        .collection('questionPapers')
        .doc(quiz?.id)
        .collection('questions')
        .doc(quiz?.questions?[index].id)
        .collection('answers')
        .doc('C');
    final json = {
      'answer': answer,
      'identifier': 'C',
    };
    await collAnswers.update(json);
  }

  Future updateAnswerD({required String answer, required int index}) async {
    final collAnswers = FirebaseFirestore.instance
        .collection('questionPapers')
        .doc(quiz?.id)
        .collection('questions')
        .doc(quiz?.questions?[index].id)
        .collection('answers')
        .doc('D');
    final json = {
      'answer': answer,
      'identifier': 'D',
    };
    await collAnswers.update(json);
  }

  static Future<void> loadData() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery =
          await questionPaperRF.doc(quiz!.id).collection("questions").get();

      //create a list
      final questions = questionQuery.docs
          .map((snapshot) => Questions.fromSnapshot(snapshot))
          .toList();
      quiz!.questions = questions;
      for (Questions question in quiz!.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answerQuery =
            await questionPaperRF
                .doc(quiz!.id)
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
      log('hoopaaa da length: ${quiz!.questions![0].question}');
      // ignore: empty_catches
    } catch (e) {}
  }

  // @override
  // void onInit() async {
  //   // await loadData();
  //   super.onInit();
  // }
}
