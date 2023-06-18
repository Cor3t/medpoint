import 'package:flutter/material.dart';

class ErrorAlert extends StatelessWidget {
  const ErrorAlert({Key? key, required this.content}) : super(key: key);
  final String content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Icon(
        Icons.error,
        size: 40,
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
      ),
    );
  }
}
