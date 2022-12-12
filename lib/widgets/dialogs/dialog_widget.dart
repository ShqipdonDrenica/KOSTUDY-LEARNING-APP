import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();
  Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }
  static Widget questionStartDialog({required VoidCallback onTap}) {
    return AlertDialog(
      content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Pershendetje....',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Text('Ju duhet te kyqeni per filluar kuizin'),
            )
          ]),
      actions: [TextButton(onPressed: onTap, child: const Text('konfirmoj'))],
    );
  }
}
