import 'package:get/get.dart';

class AuthPageController extends GetxController {
  bool isSigninMode = true;

  void toggleMode() {
    isSigninMode = !isSigninMode;
    update();
  }
}
