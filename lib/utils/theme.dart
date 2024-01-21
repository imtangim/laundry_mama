import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData lightTheme = ThemeData(
      primaryColor: const Color.fromRGBO(46, 68, 151, 1),
      useMaterial3: true,
      textTheme: const TextTheme(
        labelMedium: TextStyle(
          color: Colors.black,
        ),
      ));

  final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: const TextTheme(
        labelMedium: TextStyle(
          color: Colors.white,
        ),
      )
      /* dark theme settings */
      );
}
