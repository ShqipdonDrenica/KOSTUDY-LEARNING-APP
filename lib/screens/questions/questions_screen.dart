import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/costum_text_styles.dart';
import 'package:flutter_study_app/controllers/question_papers/question_controller.dart';
import 'package:flutter_study_app/firebase_ref/loading_status.dart';
import 'package:flutter_study_app/screens/questions/test_overview_screen.dart';
import 'package:flutter_study_app/widgets/common/background_decoration_widget.dart';
import 'package:flutter_study_app/widgets/common/custom_app_bar.dart';
import 'package:flutter_study_app/widgets/common/main_button.dart';
import 'package:flutter_study_app/widgets/common/question_place_holder.dart';
import 'package:flutter_study_app/widgets/content_area_widget.dart';
import 'package:flutter_study_app/widgets/questions/answer_card_widget.dart';
import 'package:flutter_study_app/widgets/questions/countdown_timer_widget.dart';
import 'package:get/get.dart';

class QuestionsScreen extends GetView<QuestionController> {
  const QuestionsScreen({super.key});

  static const String routeName = "/questionsscreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBarWidget(
          leading: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: const ShapeDecoration(
                shape: StadiumBorder(
                    side: BorderSide(color: onSurfaceTextColor, width: 2))),
            child: Obx(() => CountDownTimerWidget(
                time: controller.time.value, color: onSurfaceTextColor)),
          ),
          showActionIcon: true,
          titleWidget: Obx(
            () => Text(
              'Pyetja e ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}',
              style: appBarTitleStyle,
            ),
          )),
      body: BackgroundDecoration(
        child: Obx(
          () => Column(
            children: [
              if (controller.loadingStatus.value == LoadingStatus.loading)
                const Expanded(
                  child: ContentAreaWidget(child: QuestionHolderScreen()),
                ),
              if (controller.loadingStatus.value == LoadingStatus.completed)
                Expanded(
                  child: ContentAreaWidget(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Text(
                            controller.currentQuestion.value!.question,
                            style: questionText,
                          ),
                          GetBuilder<QuestionController>(
                              init: controller,
                              id: 'answer_list',
                              builder: (context) {
                                log('Das is  ${controller.currentQuestion.value!.answers!.length}');
                                return ListView.separated(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(top: 25),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final answer = controller
                                        .currentQuestion.value!.answers![index];
                                    return SizedBox(
                                      height: 50,
                                      width: 100,
                                      child: AnswerCardWidget(
                                        answer:
                                            '${answer.identifier}. ${answer.answer} ',
                                        onTap: () {
                                          controller.selectedAnswer(
                                              answer.identifier);
                                        },
                                        isSelected: answer.identifier ==
                                            controller.currentQuestion.value!
                                                .selectedAnswer,
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SizedBox(
                                    height: 10,
                                  ),
                                  itemCount: controller
                                      .currentQuestion.value!.answers!.length,
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ColoredBox(
                color: Get.theme.scaffoldBackgroundColor,
                child: Row(children: [
                  Visibility(
                    visible: true,
                    child: SizedBox(
                      width: 55,
                      height: 55,
                      child: MainButton(
                        onTap: () {
                          controller.prevQuestion();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Get.isDarkMode
                              ? onSurfaceTextColor
                              : Get.theme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 45.0),
                      child: Visibility(
                          visible: controller.loadingStatus.value ==
                              LoadingStatus.completed,
                          child: MainButton(
                            onTap: () {
                              controller.isLastQuestion
                                  ? Get.to(() => const TestOverviewScreen())
                                  : controller.nextQuestion();
                            },
                            title: controller.isLastQuestion
                                ? 'Përfundoj'
                                : 'Vazhdo',
                          )),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
