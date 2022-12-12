import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shimmer/shimmer.dart';

class QuestionHolderScreen extends StatelessWidget {
  const QuestionHolderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var line = Container(
      width: double.infinity,
      height: 12.0,
      color: Get.theme.scaffoldBackgroundColor,
    );
    var answer = Container(
      width: double.infinity,
      height: 50,
      color: Get.theme.scaffoldBackgroundColor,
    );

    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.blueGrey.withOpacity(0.5),
      child: EasySeparatedColumn(
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 20,
            );
          },
          children: [
            EasySeparatedColumn(
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
              children: [line, line, line],
            ),
            answer,
            answer,
            answer
          ]),
    );
  }
}
