import 'package:flutter/material.dart';

import '../config/template.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    this.text,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String? text;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
          onPressed: () => onPressed!(),
          child: Text(text!, style: buttonTextStyle),
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            backgroundColor: whiteColor,
            primary: blackColor,
          )),
    );
  }
}
