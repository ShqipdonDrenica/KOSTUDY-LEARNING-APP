import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';

class NotAnsweredWidget extends StatelessWidget {
  const NotAnsweredWidget({super.key, required this.answer});
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
        decoration: BoxDecoration(
            borderRadius: UIParameters.cardBorderRadius,
            color: notAnsweredColor.withOpacity(0.1)),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Text(
          answer,
          style: const TextStyle(
              color: notAnsweredColor, fontWeight: FontWeight.bold),
        ));
  }
}
