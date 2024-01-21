import 'package:get/get.dart';
import 'package:laundry_mama_rework/controller/auth_page_controller.dart';
import 'package:laundry_mama_rework/controller/dashboard_controller.dart';
import 'package:laundry_mama_rework/controller/signin_and_up_controller.dart';
import 'package:laundry_mama_rework/controller/themecontroller.dart';

class GetxDependencyBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInAndUpController());
    Get.put(AuthPageController());
    Get.put(DashboardController());
    Get.lazyPut(() => ThemeController());
    Get.put(ThemeController());
  }
}
