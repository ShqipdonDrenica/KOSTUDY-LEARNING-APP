import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_study_app/configs/themes/app_icons.dart';
import 'package:flutter_study_app/configs/themes/costum_text_styles.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:flutter_study_app/controllers/edit_quiz_controller.dart';
import 'package:flutter_study_app/controllers/quiz_paper_controller.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:flutter_study_app/widgets/app_icon_text_widget.dart';
import 'package:flutter_study_app/widgets/bottomSheet_edit_widget.dart';
import 'package:flutter_study_app/widgets/dialogs/dialog_widget.dart';
import 'package:get/get.dart';

class QuestionCardScreen extends GetView<QuizPaperController> {
  QuestionCardScreen({super.key, required this.model});

  final QuestionPaperModel model;
  final quizPaperController =
      Get.put<QuizPaperController>(QuizPaperController());

  @override
  Widget build(BuildContext context) {
    const double padding = 10;
    // QuestionPaperController _questionPaperController =
    //     Get.put(QuestionPaperController());
    return Slidable(
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            icon: Icons.edit,
            label: 'Redaktoni kuizin',
            onPressed: (value) {
              EditQuizController.question = model;
              Get.to(() => BottomSheetEditWidget());
            },
          ),
        ],
      ),
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          backgroundColor: Colors.red,
          icon: Icons.delete,
          padding: const EdgeInsets.all(10.0),
          label: 'Fshini projektin',
          onPressed: ((context) {
            Get.dialog(
                Dialogs.questionStartDialog(
                    onTap: () {
                      // paper: model, tryAgain: false);
                      quizPaperController.deleteQuiz(docId: model.id);
                      Get.back();
                    },
                    cancelOnTap: () {
                      Get.back();
                    },
                    description:
                        'Ky veprim do të fshijë gjithashtu të gjitha pyetjet. Ky veprim nuk mund të zhbëhet. A jeni i sigurt për këtë?',
                    title: 'Fshij kuizin  '),
                barrierDismissible: true);
          }),
        )
      ]),
      child: Container(
        // padding: const EdgeInsets.all(_padding),
        margin: EdgeInsets.only(
          left: mobileScreenPadding,
          right: mobileScreenPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: UIParameters.cardBorderRadius,
          color: Theme.of(context).cardColor,
        ),
        child: GestureDetector(
          onTap: () async {
            log('tapped');
            Phoenix.rebirth(context);

            await quizPaperController.navigateToQuestions(
                paper: model, tryAgain: false);
          },
          child: Padding(
            padding: const EdgeInsets.all(padding),
            child: Stack(clipBehavior: Clip.none, children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ColoredBox(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        child: SizedBox(
                          width: Get.width * 0.15,
                          height: Get.width * 0.15,
                          child: CachedNetworkImage(
                            imageUrl: model.imageUrl!,
                            placeholder: (context, url) => Container(
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                                "assets/images/app_splash_logo.png"),
                          ),
                        ),
                      )),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          style: cartTitles(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: Text(model.description),
                        ),
                        Row(
                          children: [
                            AppIconTextWidget(
                                icon: Icon(
                                  Icons.help_outline_sharp,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                ),
                                text: Text(
                                  '${model.questionCount} questions',
                                  style: detailText.copyWith(
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Theme.of(context).primaryColor,
                                  ),
                                )),
                            const SizedBox(
                              width: 15,
                            ),
                            AppIconTextWidget(
                                icon: Icon(
                                  Icons.timer,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                ),
                                text: Text(
                                  model.timeinMinutes(),
                                  style: detailText.copyWith(
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Theme.of(context).primaryColor,
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: -padding,
                  right: -padding,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(cardBorderRadius),
                        bottomRight: Radius.circular(cardBorderRadius),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Icon(
                      AppIcons.trophyOutLine,
                      color: Colors.yellow,
                    ),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
