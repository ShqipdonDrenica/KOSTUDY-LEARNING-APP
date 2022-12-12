import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';

class CorrectAnswerWidget extends StatelessWidget {
  const CorrectAnswerWidget({super.key, required this.answer});
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
        decoration: BoxDecoration(
            borderRadius: UIParameters.cardBorderRadius,
            color: correctAnswerColor.withOpacity(0.1)),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Text(
          answer,
          style: const TextStyle(
              color: correctAnswerColor, fontWeight: FontWeight.bold),
        ));
  }
}
