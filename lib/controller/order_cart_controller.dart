import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/controller/cart_controller.dart';
import 'package:laundry_mama_rework/models/order.dart';
import 'package:laundry_mama_rework/utils/service.dart';

class OrderCounterController extends GetxController {
  final CartController _cartController = Get.put(CartController());
  final CollectionReference ordersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<List<OrderDetails>> getUserOrders(String uid) async {
    try {
      DocumentSnapshot<Object?> userDoc = await ordersCollection.doc(uid).get();

      if (!userDoc.exists) {
    
        return [];
      }

      List<dynamic> ordersData = userDoc['orders'] ?? [];

      List<OrderDetails> orders = ordersData.map((orderData) {
        return OrderDetails.fromMap((orderData as Map<String, dynamic>?) ?? {});
      }).toList();

      return orders;
    } catch (e) {
    
      // Handle the error
      return [];
    }
  }

  Map<String, int> itemCounters = {
    "Sari": 0,
    "Tshirt": 0,
    "Shirt": 0,
    "Jeans": 0,
    "Dress": 0,
    "Blouse": 0,
    "Pants": 0,
    "Skirt": 0,
    "Jacket": 0
  };

  Map<String, dynamic> totalAmount = {
    "Sari": 0,
    "Tshirt": 0,
    "Shirt": 0,
    "Jeans": 0,
    "Dress": 0,
    "Blouse": 0,
    "Pants": 0,
    "Skirt": 0,
    "Jacket": 0
  };
  int finalAmount = 0;
  void addCounter(String itemId, int initialValue) {
    itemCounters[itemId] = initialValue;
    update();
  }

  void incrementCounter(String itemId) {
    if (itemCounters.containsKey(itemId)) {
      itemCounters[itemId] = itemCounters[itemId]! + 1;
      log(itemCounters.toString());
      update();
    }
  }

  void decrementCounter(String itemId) {
    if (itemCounters.containsKey(itemId)) {
      if (itemCounters[itemId]! > 0) {
        itemCounters[itemId] = itemCounters[itemId]! - 1;
      }
      update();
    }
  }

  int getCounterValue(String itemId) {
    if (itemCounters.containsKey(itemId)) {
      return itemCounters[itemId]!;
    } else {
      return 0;
    }
  }

  num calculateSum(Map<String, dynamic> map) {
    return map.values.fold(0, (previous, current) => previous + current);
  }

  num calculateAmount() {
    for (int i = 0; i < itemCounters.keys.length; i++) {
      num amount =
          itemCounters[service[i]["Cloth_name"]]! * service[i]["service_price"];

      totalAmount[service[i]["Cloth_name"]] = amount;
    }
    return calculateSum(totalAmount);
  }

  num amountAfterDeliveryChargeAdded() {
    return calculateAmount() + 50;
  }

  // Method to reset all counters
  void resetCounters() {
    Map<String, dynamic> cartData = {
      "list_of_item": itemCounters,
      "total_amount": finalAmount,
      "list_of_each_item_amount": totalAmount,
    };
    _cartController.cartItem["data"] = cartData;
    itemCounters.clear();
    totalAmount.clear();
    totalAmount = {
      "Sari": 0,
      "Tshirt": 0,
      "Shirt": 0,
      "Jeans": 0,
      "Dress": 0,
      "Blouse": 0,
      "Pants": 0,
      "Skirt": 0,
      "Jacket": 0
    };
    itemCounters = {
      "Sari": 0,
      "Tshirt": 0,
      "Shirt": 0,
      "Jeans": 0,
      "Dress": 0,
      "Blouse": 0,
      "Pants": 0,
      "Skirt": 0,
      "Jacket": 0
    };

    finalAmount = 0;
    log("all reset");
    update();
  }
}
