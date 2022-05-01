import 'package:flutter/material.dart';

// Colors
const blueColor = Colors.blue;
const whiteColor = Colors.white;
const blackColor = Colors.black;
const greyColor = Colors.grey;
const searchColor = Color(0xfff5f5f7);
const transparent = Colors.transparent;

// Button Style
var buttonTextStyle = const TextStyle(
    letterSpacing: 3, fontWeight: FontWeight.bold, fontSize: 16);

const textStyleLandingScreen = TextStyle(
    fontSize: 70,
    fontWeight: FontWeight.w900,
    color: Color.fromARGB(255, 2, 36, 63));

var buttonStyle2 = TextButton.styleFrom(
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  ),
  backgroundColor: whiteColor,
  primary: blackColor,
);

var textFieldLabelTextStyle = const TextStyle(fontSize: 12);
const bodyTextStyle = TextStyle(
    height: 1.5, fontSize: 15, fontWeight: FontWeight.w400, color: blackColor);

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
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: blackColor,
            letterSpacing: 2),
        headline4: TextStyle(
            color: blackColor, fontWeight: FontWeight.w800, fontSize: 17),
        subtitle1: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: greyColor)),
    scaffoldBackgroundColor: whiteColor);
