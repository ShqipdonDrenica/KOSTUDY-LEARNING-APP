import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:get/get.dart';

enum AnswerStatus { correct, wrong, answered, notanswered }

class AnswerCardWidget extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerCardWidget(
      {super.key,
      required this.answer,
      this.isSelected = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: UIParameters.cardBorderRadius,
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: UIParameters.cardBorderRadius,
            color: isSelected ? answerSelectedColor() : Get.theme.cardColor,
            border: Border.all(
              color: isSelected ? answerSelectedColor() : answerBorderColor(),
            )),
        child: Text(
          answer,
          style: TextStyle(color: isSelected ? onSurfaceTextColor : null),
        ),
      ),
    );
  }
}
