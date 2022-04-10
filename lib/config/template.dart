import 'package:flutter/material.dart';

// Colors
const blueColor = Colors.blue;
const whiteColor = Colors.white;
const blackColor = Colors.black;
const greyColor = Colors.grey;

// Button Style
var buttonTextStyle = const TextStyle(
    letterSpacing: 3, fontWeight: FontWeight.bold, fontSize: 16);

var buttonStyle1 = TextButton.styleFrom(
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      side: BorderSide(color: blueColor, width: 2)),
  primary: blueColor,
);

var buttonStyle2 = TextButton.styleFrom(
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  backgroundColor: blueColor,
  primary: whiteColor,
);

var textFieldLabelTextStyle = const TextStyle(fontSize: 12);

ThemeData themeData = ThemeData(
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: blackColor,
            letterSpacing: 2),
        headline2: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: blackColor,
            letterSpacing: 2),
        headline3: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: blackColor,
            letterSpacing: 2),
        subtitle1: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: greyColor)),
    scaffoldBackgroundColor: whiteColor);
