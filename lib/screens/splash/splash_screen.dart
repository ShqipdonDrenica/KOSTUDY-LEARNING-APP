import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Get.theme.primaryColor,
        alignment: Alignment.center,
        // decoration: BoxDecoration(gradient: mainGradient()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/kstdicon.svg',
                width: 111, height: 111, color: Colors.white),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'KOSTUDY',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                      fontFamily: 'Brefa',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'LEARNING',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                      fontFamily: 'Brefa',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'APP',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                      fontFamily: 'Brefa',
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
