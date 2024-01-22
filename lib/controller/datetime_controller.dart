import 'dart:developer';

import 'package:get/get.dart';
import 'package:laundry_mama_rework/utils/service.dart';

class DateController extends GetxController {
  String pickupDate = "";
  String pickupTime = "";
  String deliveryDate = "";
  String deliveryTime = "";

  void uPdate() {
    update();
  }

  void resetCounters() {
    pickupDate = "";
    pickupTime = "";
    deliveryDate = "";
    deliveryTime = "";
  }
}
