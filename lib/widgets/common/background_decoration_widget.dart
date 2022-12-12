import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class BackgroundDecoration extends StatelessWidget {
  const BackgroundDecoration(
      {super.key, required this.child, this.showGradient = false});
  final Widget child;
  final bool showGradient;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              color: showGradient ? null : Get.theme.primaryColor,
              gradient: showGradient ? mainGradient() : null,
            ),
            // child: CustomPaint(
            //   painter: BackgroundPainter(),
            // ),
          ),
        ),
        Positioned(child: SafeArea(child: child)),
      ],
    );
  }
}
