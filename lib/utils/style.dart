import 'package:flutter/material.dart';

class CustomStyle {
  static TextStyle headingStyle =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
  static TextStyle contentStyle = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'sfpro');
  static LinearGradient gradientStyle = const LinearGradient(
      colors: [Color(0xe61f8655), Color(0xff64b72d)],
      stops: [0, 1],
      begin: Alignment.topCenter,
      end: Alignment.topLeft);
}
