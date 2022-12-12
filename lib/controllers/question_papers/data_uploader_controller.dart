import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study_app/firebase_ref/loading_status.dart';
import 'package:flutter_study_app/firebase_ref/references.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataUploaderController extends GetxController {
  final loadingStatus = LoadingStatus.loading.obs;

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading; //0->value has 0

    FirebaseFirestore fireStore = FirebaseFirestore.instance;

    //access in data in asset foolder and reading json data use this
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");

    //read json file
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    //load json file
    final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith('assets/DB/paper') && path.contains('.json'))
        .toList();

    if (kDebugMode) {
      print(papersInAssets);
    }

    //read the content
    List<QuestionPaperModel> questionPapers = [];
    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers
          .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }
    // print('Items number ${questionPapers[0].title}');

    //return an object for batch operation
    var batch = fireStore.batch();

    //create fields for each document
    for (var paper in questionPapers) {
      //document would be each of the json file like biology, chemistry
      batch.set(questionPaperRF.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "question_count": paper.questions == null ? 0 : paper.questions!.length
      });
      for (var questions in paper.questions!) {
        final questionPath =
            questionRF(paperId: paper.id, questionId: questions.id);
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer
        });
        for (var answer in questions.answers!) {
          batch.set(questionPath.collection("answers").doc(answer.identifier),
              {"identifier": answer.identifier, "answer": answer.answer});
        }
      }
    }
    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
  }

  //for upload data in firebase
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }
}
