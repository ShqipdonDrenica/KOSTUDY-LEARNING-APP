import 'package:flutter/cupertino.dart';

class AppIconTextWidget extends StatelessWidget {
  const AppIconTextWidget({super.key, required this.icon, required this.text});

  final Icon icon;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 4,
        ),
        text
      ],
    );
  }
}
