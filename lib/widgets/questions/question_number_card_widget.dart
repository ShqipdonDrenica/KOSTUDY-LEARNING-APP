import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:flutter_study_app/widgets/questions/answer_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class QuestionNumberCardWidget extends StatelessWidget {
  const QuestionNumberCardWidget(
      {super.key, required this.index, this.status, this.onTap});
  final int index;
  final AnswerStatus? status;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Get.theme.primaryColor;
    switch (status) {
      case AnswerStatus.answered:
        backgroundColor = Get.theme.primaryColor;
        break;
      case AnswerStatus.correct:
        backgroundColor = correctAnswerColor;
        break;
      case AnswerStatus.wrong:
        backgroundColor = wrongAnswerColor;

        break;
      case AnswerStatus.notanswered:
        backgroundColor = notAnsweredColor;
        break;
      default:
        backgroundColor = Get.theme.primaryColor.withOpacity(0.1);
    }
    return GestureDetector(
      onTap: onTap,
      // borderRadius: UIParameters.cardBorderRadius,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: UIParameters.cardBorderRadius,
        ),
        child: Center(
          child: Text(
            '$index',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
