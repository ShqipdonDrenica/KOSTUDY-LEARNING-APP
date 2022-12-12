import 'package:flutter/material.dart';
import 'package:flutter_study_app/controllers/question_papers/question_controller.dart';
import 'package:flutter_study_app/widgets/common/background_decoration_widget.dart';
import 'package:flutter_study_app/widgets/common/custom_app_bar.dart';
import 'package:flutter_study_app/widgets/common/main_button.dart';
import 'package:flutter_study_app/widgets/content_area_widget.dart';
import 'package:flutter_study_app/widgets/questions/answer_card_widget.dart';
import 'package:flutter_study_app/widgets/questions/countdown_timer_widget.dart';
import 'package:flutter_study_app/widgets/questions/question_number_card_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class TestOverviewScreen extends GetView<QuestionController> {
  const TestOverviewScreen({super.key});
  static const String routeName = "/testoverviewscreen";

  @override
  Widget build(BuildContext context) {
    AnswerStatus? answerStatus;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBarWidget(title: controller.completedTest),
      body: BackgroundDecoration(
          child: Column(
        children: [
          Expanded(
              child: ContentAreaWidget(
            child: Column(
              children: [
                Row(
                  children: [
                    CountDownTimerWidget(
                        color: Get.theme.primaryColor, time: ''),
                    Obx(
                      () => Text(
                        '${controller.time} Kohë të mbetur',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.allQuestions.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Get.width ~/ 75,
                        childAspectRatio: 1,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8),
                    itemBuilder: (_, index) {
                      if (controller.allQuestions[index].selectedAnswer !=
                          null) {
                        answerStatus = AnswerStatus.answered;
                      }
                      return QuestionNumberCardWidget(
                        index: index + 1,
                        status: answerStatus,
                        onTap: () {
                          controller.jumpToQuestion(index);
                        },
                      );
                    },
                  ),
                ),
                ColoredBox(
                  color: Get.theme.scaffoldBackgroundColor,
                  child: MainButton(
                    onTap: () {
                      controller.Complete();
                    },
                    title: 'Përfundo',
                  ),
                )
              ],
            ),
          ))
        ],
      )),
    );
  }
}
