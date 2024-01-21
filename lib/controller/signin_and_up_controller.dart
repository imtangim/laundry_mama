import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/controller/auth_page_controller.dart';
import 'package:laundry_mama_rework/controller/dashboard_controller.dart';
import 'package:laundry_mama_rework/screen/authentication_page.dart';
import 'package:laundry_mama_rework/screen/dashboard.dart';

class SignInAndUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthPageController _authPageController = Get.find<AuthPageController>();
  final DashboardController _dashboardController =
      Get.find<DashboardController>();
  bool isLoading = false;

  void signIn() async {
    isLoading = true;
    update();
    await Future.delayed(const Duration(seconds: 2));

    log('Email: ${emailController.text}, Password: ${passwordController.text}');
    Get.offAll(() => const Dashboard());
    emailController.clear();
    passwordController.clear();

    isLoading = false;
    update();
  }

  void logout() {
    _authPageController.isSigninMode = true;
    _dashboardController.currentPageIndex = 0;
    Get.offAll(() => const AuthenticationPage());
  }

  Future<void> signUp() async {
    isLoading = true;
    update();
    await Future.delayed(const Duration(seconds: 2));

    Get.off(
      () => const Dashboard(),
    );

    isLoading = false;
    update();
  }
}
