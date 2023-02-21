import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/controllers/create_quiz_controller.dart';
import 'package:flutter_study_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter_study_app/screens/home/home_screen.dart';
import 'package:flutter_study_app/screens/home/user_home_screen.dart';
import 'package:flutter_study_app/widgets/app_circle_button_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  AppIntroductionScreen({super.key});
  MyZoomDraweController myZoomDraweController =
      Get.put(MyZoomDraweController());
  CreateQuizController createQuizController =
      Get.put<CreateQuizController>(CreateQuizController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset('assets/images/kstdicon.svg',
                width: 111, height: 111, color: Colors.white),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Ky është një aplikacion studimi. Ky aplikacion është zhvilluar që të ju ndihmojë nxënësve të gjimnazit në përgaditje për testin e semi-maturës përmes kuizeve dhe modeleve të ndryshme te testeve. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            AppCircleButtonWidget(
              onTap: () {
                myZoomDraweController.user.value == null ||
                        myZoomDraweController.user.value!.email !=
                            'shqipdondrenica@gmail.com'
                    ? Get.to(() => UserHomeScreen())
                    : Get.to(() => HomeScreen());

                // createQuizController
                //     .getUserRole(myZoomDraweController.user.value!.email);
              },
              child: const Icon(
                Icons.arrow_forward,
                size: 35,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
