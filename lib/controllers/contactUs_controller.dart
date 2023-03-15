// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController {
  final nameController = TextEditingController().obs;
  final surnameController = TextEditingController().obs;
  final commentController = TextEditingController().obs;
  Future createContactUs(
      {required String name,
      required String surname,
      required String comment}) async {
    final docContactUs =
        FirebaseFirestore.instance.collection('contactUs').doc();

    final json = {
      'name': name,
      'surname': surname,
      'comment': comment,
    };
    await docContactUs.set(json);
  }
}
