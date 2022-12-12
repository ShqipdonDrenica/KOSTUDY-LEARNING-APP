import 'package:flutter/material.dart';
import 'package:flutter_study_app/controllers/question_papers/question_controller.dart';
import 'package:flutter_study_app/screens/result_screen.dart';
import 'package:flutter_study_app/widgets/common/background_decoration_widget.dart';
import 'package:flutter_study_app/widgets/common/custom_app_bar.dart';
import 'package:flutter_study_app/widgets/content_area_widget.dart';
import 'package:flutter_study_app/widgets/questions/answer_card_widget.dart';
import 'package:flutter_study_app/widgets/questions/correct_answer_widget.dart';
import 'package:flutter_study_app/widgets/questions/not_answered_widget.dart';
import 'package:flutter_study_app/widgets/questions/wrong_answer_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CheckAnswerScreen extends GetView<QuestionController> {
  const CheckAnswerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBarWidget(
        titleWidget: Obx(() => Text(
              'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            )),
        showActionIcon: true,
        onMenuActionTap: () {
          Get.to(() => ResultScreen());
        },
      ),
      body: BackgroundDecoration(
        child: Obx(
          (() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ContentAreaWidget(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Text(controller.currentQuestion.value!.question),
                            const SizedBox(
                              height: 30,
                            ),
                            GetBuilder<QuestionController>(
                              id: 'answer_review_list',
                              builder: (_) {
                                return ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (_, index) {
                                      final answer = controller.currentQuestion
                                          .value!.answers![index];
                                      final selectedAnswer = controller
                                          .currentQuestion
                                          .value!
                                          .selectedAnswer;

                                      final correctAnswer = controller
                                          .currentQuestion.value?.correctAnswer;

                                      final String answerText =
                                          '${answer.identifier}. ${answer.answer}';
                                      if (correctAnswer == selectedAnswer &&
                                          answer.identifier == selectedAnswer) {
                                        return CorrectAnswerWidget(
                                            answer: answerText);
                                      } else if (selectedAnswer == null) {
                                        return NotAnsweredWidget(
                                            answer: answerText);
                                      } else if (correctAnswer !=
                                              selectedAnswer &&
                                          answer.identifier == selectedAnswer) {
                                        return WrongAnswerWidget(
                                            answer: answerText);
                                      } else if (correctAnswer ==
                                          answer.identifier) {
                                        return CorrectAnswerWidget(
                                            answer: answerText);
                                      }
                                      return AnswerCardWidget(
                                        answer: answerText,
                                        onTap: () {},
                                        isSelected: false,
                                      );
                                    },
                                    separatorBuilder: (_, index) {
                                      return const SizedBox(
                                        height: 20,
                                      );
                                    },
                                    itemCount: controller.currentQuestion.value!
                                        .answers!.length);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
