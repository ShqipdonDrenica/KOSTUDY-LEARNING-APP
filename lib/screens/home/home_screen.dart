import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/app_icons.dart';
import 'package:flutter_study_app/configs/themes/costum_text_styles.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:flutter_study_app/controllers/create_quiz_controller.dart';
import 'package:flutter_study_app/controllers/quiz_paper_controller.dart';
import 'package:flutter_study_app/controllers/zoom_drawer_controller.dart';

import 'package:flutter_study_app/screens/home/menu_screen.dart';
import 'package:flutter_study_app/screens/home/question_card_screen.dart';
import 'package:flutter_study_app/widgets/app_circle_button_widget.dart';
import 'package:flutter_study_app/widgets/bottom_sheet_create_widget.dart';
import 'package:flutter_study_app/widgets/content_area_widget.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeScreen extends GetView<MyZoomDraweController> {
  HomeScreen({super.key});
  QuizPaperController questionPaperController = Get.put(QuizPaperController());
  CreateQuizController createQuizController = Get.put(CreateQuizController());
  MyZoomDraweController myZoomDraweController =
      Get.put(MyZoomDraweController());
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: GetBuilder<MyZoomDraweController>(
        builder: (_) {
          return ZoomDrawer(
            borderRadius: 50,
            controller: myZoomDraweController.zoomDrawerController,
            showShadow: true,

            angle: 0,
            style: DrawerStyle.defaultStyle,
            menuScreenWidth: Get.width,
            // menuBackgroundColor: Colors.transparent,
            slideWidth: Get.width * 0.8,
            menuScreen: MenuScreen(),
            mainScreen: Container(
              decoration: BoxDecoration(gradient: mainGradient()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(mobileScreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: controller.toogleDrawer,
                            child: const AppCircleButtonWidget(
                              child: Icon(
                                AppIcons.menuLeft,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              children: [
                                const Icon(
                                  AppIcons.peace,
                                ),
                                Text(
                                  '  Përshendetje studenta',
                                  style: detailText.copyWith(
                                      color: onSurfaceTextColor),
                                )
                              ],
                            ),
                          ),
                          const Text(
                            'Çfarë doni të testoheni sot',
                            style: headerText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ignore: unrelated_type_equality_checks

                  // ignore: unrelated_type_equality_checks
                  // createQuizController.getUserRole(
                  //           email: controller.user.value!.email ?? '',
                  //         ) ==
                  //         0
                  //     ?
                  // controller.user.value!.email.toString() ==
                  //         'shqipdondrenica@gmail.com'
                  // ?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Text(
                            'Deshironi te shtoni nje kuiz?',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                            width: 100,
                            height: 50,
                            color: Colors.white,
                            child: TextButton(
                              child: const Text('Shto nje kuiz'),
                              onPressed: () {
                                Get.offAll(() => BottomSheetCreateWidget());
                              },
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ContentAreaWidget(
                        addPadding: false,
                        child: Obx(
                          () => ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return QuestionCardScreen(
                                  model:
                                      questionPaperController.allPapers[index],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 20,
                                );
                              },
                              itemCount:
                                  questionPaperController.allPapers.length),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
