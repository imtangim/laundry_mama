import 'package:get/get.dart';

class DashboardController extends GetxController {
  int currentPageIndex = 0;

  List<String> barTitle = ["Home", "Order", "Profile"];

  void changePageIndex(int newIndex) {
    currentPageIndex = newIndex;
    update();
  }
}
