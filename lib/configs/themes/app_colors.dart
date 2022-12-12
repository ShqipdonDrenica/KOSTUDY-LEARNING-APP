import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_dark_theme.dart';
import 'package:flutter_study_app/configs/themes/app_light_theme.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

const Color onSurfaceTextColor = Colors.white;
const Color correctAnswerColor = Colors.green;
const Color wrongAnswerColor = Colors.red;
const Color notAnsweredColor = Colors.grey;

const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [primaryColorDark, primaryColorLight],
);
const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDarkColorDark, primaryColorDark]);

LinearGradient mainGradient() =>
    UIParameters.isDarkMode() ? mainGradientDark : mainGradientLight;

Color costumScaffoldColor(BuildContext context) => UIParameters.isDarkMode()
    ? const Color(0xFF2e3c62)
    : const Color.fromARGB(255, 240, 237, 255);
Color answerSelectedColor() => UIParameters.isDarkMode()
    ? Get.theme.cardColor.withOpacity(0.5)
    : Get.theme.primaryColor;
Color answerBorderColor() => UIParameters.isDarkMode()
    ? const Color.fromARGB(255, 20, 46, 158)
    : const Color.fromARGB(255, 221, 221, 221);
