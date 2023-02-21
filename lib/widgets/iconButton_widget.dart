import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({super.key, required this.iconData});

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        height: 100,
        child: IconButton(
          iconSize: 100,
          icon: Icon(
            iconData,
          ),
          onPressed: () {},
        ));
  }
}
