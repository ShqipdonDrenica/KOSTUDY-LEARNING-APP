import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:flutter_study_app/screens/questions/questions_screen.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;
  var fireStore = FirebaseFirestore.instance;

  var titleQuizController = TextEditingController().obs;
  var descriptionQuizController = TextEditingController().obs;

  var idQuizControllerController = TextEditingController().obs;

  var imageQuizController = TextEditingController().obs;

  var numberOfQuestionController = TextEditingController().obs;

  var timeQuizController = TextEditingController().obs;

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
    super.onInit();
  }
}
