import 'package:flutter/material.dart';

import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:flutter_study_app/controllers/question_papers/question_controller.dart';
import 'package:flutter_study_app/controllers/question_papers/questions_extension_controller.dart';
import 'package:flutter_study_app/screens/questions/check_answer_screen.dart';
import 'package:flutter_study_app/widgets/common/background_decoration_widget.dart';
import 'package:flutter_study_app/widgets/common/main_button.dart';
import 'package:flutter_study_app/widgets/questions/answer_card_widget.dart';
import 'package:flutter_study_app/widgets/questions/question_number_card_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

import '../widgets/content_area_widget.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});
  final questionController = Get.put<QuestionController>(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Get.theme.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Get.theme.primaryColor,
        shadowColor: Get.theme.primaryColor,
        title: Text(questionController.correctAnswerQuestion()),
      ),
      body: BackgroundDecoration(
        child: Column(
          children: [
            Expanded(
              child: ContentAreaWidget(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 38.0),
                      child: SvgPicture.asset('assets/images/bulb.svg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(questionController.achivement(),
                          style: TextStyle(
                              color: Get.theme.primaryColor, fontSize: 18)),
                    ),
                    Text('Ju keni ${questionController.points()} pikë',
                        style: TextStyle(color: Get.theme.primaryColor)),
                    const Padding(
                      padding: EdgeInsets.only(top: 25.0, bottom: 25),
                      child: Text(
                        'Klikoni në numrat e pyetjeve më poshtë për të parë përgjigjet e sakta ',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: Get.width ~/ 75,
                              childAspectRatio: 1,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemCount: questionController.allQuestions.length,
                            itemBuilder: (_, index) {
                              final question =
                                  questionController.allQuestions[index];
                              AnswerStatus status = AnswerStatus.notanswered;
                              final selectedAnswer = question.selectedAnswer;
                              final correctAnswer = question.correctAnswer;
                              if (selectedAnswer == correctAnswer) {
                                status = AnswerStatus.correct;
                              } else {
                                status = AnswerStatus.wrong;
                              }
                              return QuestionNumberCardWidget(
                                index: index + 1,
                                status: status,
                                onTap: () {
                                  questionController.jumpToQuestion(index,
                                      isGoBack: false);
                                  Get.to(() => const CheckAnswerScreen());
                                },
                              );
                            }))
                  ],
                ),
              ),
            ),
            ColoredBox(
              color: Get.theme.scaffoldBackgroundColor,
              child: Padding(
                padding: UIParameters.mobileScreenPadding,
                child: Row(children: [
                  Expanded(
                      child: MainButton(
                    onTap: () {
                      questionController.tryAgain();
                    },
                    color: Colors.grey,
                    title: 'Provo përsëri',
                  )),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: MainButton(
                    onTap: () async {
                      await questionController.saveTestResults();
                    },
                    title: 'Kthehu në kryefaqe ',
                  )),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
