import 'package:get/get.dart';
import 'package:laundry_mama_rework/controller/auth_page_controller.dart';
import 'package:laundry_mama_rework/controller/cart_controller.dart';
import 'package:laundry_mama_rework/controller/contact_details.dart';
import 'package:laundry_mama_rework/controller/datetime_controller.dart';
import 'package:laundry_mama_rework/controller/order_cart_controller.dart';
import 'package:laundry_mama_rework/controller/dashboard_controller.dart';
import 'package:laundry_mama_rework/controller/payment_controllerAPP.dart';
import 'package:laundry_mama_rework/controller/reset_controller.dart';
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
    Get.put(OrderCounterController());
    Get.put(CartController());
    Get.put(DateController());
    Get.put(ResetController());
    Get.put(ContactController());
    Get.put(PaymentControllerAPP());
  }
}
