import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';

class WrongAnswerWidget extends StatelessWidget {
  const WrongAnswerWidget({super.key, required this.answer});
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
        decoration: BoxDecoration(
            borderRadius: UIParameters.cardBorderRadius,
            color: wrongAnswerColor.withOpacity(0.1)),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Text(
          answer,
          style: const TextStyle(
              color: wrongAnswerColor, fontWeight: FontWeight.bold),
        ));
  }
}
