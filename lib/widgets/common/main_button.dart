import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:get/get.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      this.title = '',
      required this.onTap,
      this.enabled = true,
      this.child,
      this.color});

  final String title;
  final Function() onTap;
  // ignore: prefer_typing_uninitialized_variables
  final enabled;
  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
          height: 60,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: color ?? Theme.of(context).cardColor),
              width: double.maxFinite,
              child: child ??
                  Center(
                      child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode
                          ? onSurfaceTextColor
                          : Get.theme.primaryColor,
                    ),
                  )),
            ),
          )),
    );
  }
}
