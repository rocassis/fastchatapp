import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final String text;

  const AlertDialogWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(''),
      content: Text(text),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
