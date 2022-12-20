import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:get/get.dart';

class EditQuizController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;
  var fireStore = FirebaseFirestore.instance;

  static QuestionPaperModel? question;

  //controllers for quiz
  var titleQuizController = TextEditingController(text: question?.title).obs;
  var descriptionQuizController =
      TextEditingController(text: question?.description).obs;
  var imageQuizController = TextEditingController(text: question?.imageUrl).obs;
  var timeQuizController =
      TextEditingController(text: question?.timeSeconds.toString()).obs;

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

  Future updateQuiz() async {
    final docQuiz = FirebaseFirestore.instance
        .collection('questionPapers')
        .doc(question!.id);

    final json = {
      'title': titleQuizController.value.text,
      'description': descriptionQuizController.value.text,
      'id': question!.id,
      'image_url': imageQuizController.value.text,
      'question_count': 5,
      'time_seconds': timeQuizController.value.text
    };
    await docQuiz.update(json);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
