import 'package:get/get.dart';
import 'package:laundry_mama_rework/controller/cart_controller.dart';
import 'package:laundry_mama_rework/controller/datetime_controller.dart';
import 'package:laundry_mama_rework/controller/order_cart_controller.dart';

class ResetController extends GetxController {
  final OrderCounterController _orderCounterController =
      Get.put(OrderCounterController());
  final DateController _dateController = Get.put(DateController());

  void resetAll() {
    _orderCounterController.resetCounters();
    _dateController.resetCounters();
    update();
  }
}
