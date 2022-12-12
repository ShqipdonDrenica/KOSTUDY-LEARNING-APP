import 'package:flutter/material.dart';
import 'package:flutter_study_app/controllers/question_papers/data_uploader_controller.dart';
import 'package:flutter_study_app/firebase_ref/loading_status.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({Key? key}) : super(key: key);
  DataUploaderController dataUploaderController =
      Get.put(DataUploaderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx((() => Text(
              dataUploaderController.loadingStatus.value ==
                      LoadingStatus.completed
                  ? "Uploading completed"
                  : "Uploading...",
            ))),
      ),
    );
  }
}
