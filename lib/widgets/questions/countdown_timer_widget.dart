import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CountDownTimerWidget extends StatelessWidget {
  const CountDownTimerWidget({super.key, this.color, required this.time});
  final Color? color;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: color ?? Get.theme.primaryColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          time,
          style: const TextStyle(letterSpacing: 2, color: Colors.white
              // UIParameters.isDarkMode()
              //     ? Get.theme.textTheme.bodyText1!.color
              //     : Get.theme.primaryColor
              ),
        )
      ],
    );
  }
}
