import 'package:flutter/material.dart';

import '../config/template.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    this.text,
    this.buttonStyle,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String? text;
  final ButtonStyle? buttonStyle;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
          onPressed: () => onPressed!(),
          child: Text(text!, style: buttonTextStyle),
          style: buttonStyle),
    );
  }
}
