import 'package:flutter/material.dart';

class AppCircleButtonWidget extends StatelessWidget {
  const AppCircleButtonWidget(
      {super.key,
      required this.child,
      this.color,
      this.width = 60,
      this.onTap});
  final Widget child;
  final Color? color;
  final double width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      shape: const CircleBorder(),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(width: 40, height: 40, child: child),
      ),
    );
  }
}
