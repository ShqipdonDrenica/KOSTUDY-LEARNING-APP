import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/controllers/auth_controller.dart';
import 'package:flutter_study_app/controllers/zoom_drawer_controller.dart';
import 'package:flutter_study_app/widgets/contact_us/contact_us_widget.dart';
import 'package:flutter_study_app/widgets/drawerButtonWidget.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MenuScreen extends GetView<MyZoomDraweController> {
  MenuScreen({super.key});

  AuthController authController = Get.put<AuthController>(AuthController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Color.fromARGB(255, 179, 129, 187),
        gradient: mainGradient(),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: BackButton(
                color: Colors.white,
                onPressed: () {
                  controller.toogleDrawer();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: Get.width * 0.42),
              child: Column(
                children: [
                  controller.getUser() == null
                      ? const Padding(
                          padding: EdgeInsets.only(left: 28.0, top: 10),
                          child: Text(
                            "Ju nuk jeni kyqur",
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                            left: 28.0,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 45.0,
                                height: 45.0,
                                child: CachedNetworkImage(
                                  imageUrl: controller.user.value!.photoURL!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                  ),
                                  child: Text(
                                    controller.user.value!.displayName ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 17,
                                        color: onSurfaceTextColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  const Spacer(
                    flex: 2,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.contact_mail),
                        onPressed: () => Get.bottomSheet(
                          ContactUsWidget(),
                        ),
                      ),
                      const Text(
                        'Contact Us',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.facebook();
                        },
                        icon: const Icon(Icons.facebook),
                      ),
                      const Text(
                        'Facebook',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Row(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.logout),
                          onPressed: () {
                            controller.user.value == null
                                ? authController.navigateToLoginPage()
                                : controller.signOut();
                          }),
                      Text(
                        controller.user.value == null ? 'Kyçu' : "Dil",
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
