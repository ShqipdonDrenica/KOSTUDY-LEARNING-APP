import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';

class ContentAreaWidget extends StatelessWidget {
  final bool addPadding;
  final Widget child;
  const ContentAreaWidget(
      {super.key, this.addPadding = true, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          color: costumScaffoldColor(context),
        ),
        padding: addPadding
            ? EdgeInsets.only(
                top: mobileScreenPadding,
                left: mobileScreenPadding,
                right: mobileScreenPadding)
            : EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
