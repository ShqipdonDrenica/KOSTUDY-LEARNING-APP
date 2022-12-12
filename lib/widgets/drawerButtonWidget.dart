// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton(
      {super.key, required this.icon, required this.label, this.onPressed});

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 25,
        color: Colors.white,
      ),
      label: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
