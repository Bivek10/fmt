import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  //rgba(1,95,101,255)
  static const Color primaryColor = Color.fromRGBO(1, 95, 101, 1);
  static const Color orangeColor = Color.fromRGBO(241, 131, 49, 1);
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Color(0xFFfbfbfb);
  static const Color backgroundColor1 = Color(0xFFC4C4C4);
  static const Color backgroundColor2 = Color(0xFFfbfbfb);
  static const Color fillColor = Color(0xFFF1F1F1);
  static const Color boxFillColor = Color(0xFFF9F9F9);
  static const Color sucessColor = Color.fromRGBO(1, 95, 101, 1);
  static const Color errorColor = Color.fromARGB(255, 239, 59, 43);
  static const Color textColor = Color.fromRGBO(255, 255, 255, 255);
  static const LinearGradient gradient1 = LinearGradient(colors: [
    Color.fromARGB(255, 234, 255, 251),
    Color.fromARGB(255, 206, 249, 255),
    Color.fromARGB(255, 186, 255, 241),
  ], stops: [
    0.01,
    0.4167,
    1.0
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const LinearGradient gradient2 = LinearGradient(colors: [
    Color.fromARGB(255, 221, 255, 248),
    Color.fromARGB(255, 222, 251, 255),
    Color.fromARGB(255, 237, 253, 250),
  ], stops: [
    0.01,
    0.4167,
    1.0
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
}
