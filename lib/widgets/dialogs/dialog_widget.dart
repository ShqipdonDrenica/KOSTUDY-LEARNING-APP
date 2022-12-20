import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();
  Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }
  static Widget questionStartDialog(
      {required VoidCallback onTap,
      required String title,
      required String description,
      VoidCallback? cancelOnTap}) {
    return AlertDialog(
      content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(description),
            )
          ]),
      actions: [
        title != 'Pershendetje...'
            ? TextButton(
                onPressed: cancelOnTap,
                child: const Text(
                  'Anuloj',
                  style: TextStyle(color: Colors.black),
                ))
            : const SizedBox.shrink(),
        TextButton(
            onPressed: onTap,
            child: title == 'Pershendetje...'
                ? const Text('konfirmoj')
                : Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 30,
                    color: Colors.red,
                    child: const Text(
                      'Fshij',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ))
      ],
    );
  }
}
