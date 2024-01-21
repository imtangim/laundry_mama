import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/utils/theme.dart';

class ThemeController extends GetxController {
  bool isDarkMode = false;

  ThemeData get currentTheme =>
      isDarkMode ? AppTheme().darkTheme : AppTheme().lightTheme;

  void toggleTheme() {
    isDarkMode = !isDarkMode;

    update();
  }
}
