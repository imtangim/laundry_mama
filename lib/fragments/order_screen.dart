import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/components/widget/background_common.dart';
import 'package:laundry_mama_rework/components/widget/order_progress_bar.dart';
import 'package:laundry_mama_rework/controller/cart_controller.dart';
import 'package:laundry_mama_rework/controller/contact_details.dart';
import 'package:laundry_mama_rework/controller/datetime_controller.dart';
import 'package:laundry_mama_rework/controller/order_cart_controller.dart';
import 'package:laundry_mama_rework/controller/payment_controllerAPP.dart';
import 'package:laundry_mama_rework/controller/reset_controller.dart';
import 'package:laundry_mama_rework/controller/signin_and_up_controller.dart';
import 'package:laundry_mama_rework/fragments/complete.dart';
import 'package:laundry_mama_rework/fragments/list.dart';
import 'package:laundry_mama_rework/fragments/contact_details.dart';
import 'package:laundry_mama_rework/fragments/payment_failed.dart';
import 'package:laundry_mama_rework/fragments/payments.dart';
import 'package:laundry_mama_rework/fragments/pic_date.dart';
import 'package:laundry_mama_rework/models/order.dart';
import 'package:laundry_mama_rework/utils/color.dart';
import 'package:laundry_mama_rework/utils/payment_controller.dart';
import 'package:uuid/uuid.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final PaymentController _paymentController = Get.put(PaymentController());
  double _value = 0;
  Color completeColor = CustomAsset.primaryColor;
  Color incompleteColor = CustomAsset.foregroundColor;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  String generateUniqueId() {
    final uuid = Uuid();
    return uuid.v4(); // Generates a Version 4 (random) UUID
  }

  String generateTransactionId() {
    final uuid = Uuid();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final uniqueId = uuid.v4();
    return '$timestamp-$uniqueId';
  }

  void main() {
    print(generateTransactionId());
  }

  Future<bool?> _makePayment(int amount) async {
    bool? result = await _paymentController.makePayment(
      amount: (amount ~/ 110).toString(),
      currency: "USD",
    );

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetController>(builder: (controller) {
      return PopScope(
        onPopInvoked: (didPop) {
          controller.resetAll(); // Reset counters
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(46, 68, 151, 1),
            foregroundColor: Colors.white,
            automaticallyImplyLeading:
                _paymentController.paymentSuccess == false ? false : true,
            title: Text(
              "Order page",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: GetBuilder<PaymentController>(builder: (controller) {
                return Stack(
                  children: [
                    const BackgroundCommon(),
                    Column(
                      mainAxisAlignment: currentIndex == 4
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        if (controller.datafieldpage == true)
                          OrderProgressBar(
                            value: _value,
                            indicator: controller.paymentSuccess ?? false,
                            completeColor: completeColor,
                            incompleteColor: incompleteColor,
                            currentIndex: currentIndex,
                          ),
                        if (currentIndex == 0)
                          const ListOfLaundry()
                        else if (currentIndex == 1)
                          const PickDate()
                        else if (currentIndex == 2)
                          const SingleChildScrollView(
                            child: LocationAddress(),
                          )
                        else if (currentIndex == 3)
                          const PaymentMethod()
                        else if (currentIndex == 4)
                          controller.isPaymentloading
                              ? const CircularProgressIndicator()
                              : controller.paymentSuccess == false
                                  ? const PaymentFailed(
                                      status: 400,
                                      text: "Payment",
                                    )
                                  : controller.paymentSuccess == true
                                      ? const SizedBox(
                                          height: 600,
                                          width: double.maxFinite,
                                          child: Center(
                                            child: Complete(
                                              text: "Success",
                                              status: 200,
                                            ),
                                          ),
                                        )
                                      : Container(),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (currentIndex < 4)
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        fixedSize:
                                            Size(context.width * 0.4, 30),
                                        backgroundColor:
                                            CustomAsset.primaryColor,
                                        foregroundColor:
                                            CustomAsset.foregroundColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (_value > 0) {
                                          _value -= 0.25;
                                        }

                                        if (currentIndex > 0) {
                                          currentIndex -= 1;
                                        }
                                        setState(() {});
                                      },
                                      child: const Text("Back"),
                                    ),
                                  if (currentIndex < 3)
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        fixedSize:
                                            Size(context.width * 0.4, 30),
                                        backgroundColor:
                                            CustomAsset.primaryColor,
                                        foregroundColor:
                                            CustomAsset.foregroundColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (_value < 1) {
                                          _value += 0.25;
                                        }

                                        if (currentIndex < 4) {
                                          currentIndex += 1;
                                        }
                                        setState(() {});
                                      },
                                      child: const Text("Next"),
                                    ),
                                  if (currentIndex == 3)
                                    GetBuilder<SignInAndUpController>(
                                        builder: (userdata) {
                                      return GetBuilder<ContactController>(
                                          builder: (contactpage) {
                                        return GetBuilder<DateController>(
                                            builder: (datepage) {
                                          return GetBuilder<
                                                  OrderCounterController>(
                                              builder: (ordercounter) {
                                            return GetBuilder<
                                                    PaymentControllerAPP>(
                                                builder: (paymentpage) {
                                              return ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  fixedSize: Size(
                                                      context.width * 0.4, 30),
                                                  backgroundColor:
                                                      CustomAsset.primaryColor,
                                                  foregroundColor: CustomAsset
                                                      .foregroundColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  if (paymentpage.card) {
                                                    final res = await _makePayment(
                                                        ordercounter
                                                            .amountAfterDeliveryChargeAdded()
                                                            .toInt());
                                                    if (res == true) {
                                                      log(res.toString());

                                                      OrderDetails order =
                                                          OrderDetails(
                                                        orderStatus:
                                                            "picking up",
                                                        paymentID:
                                                            generateTransactionId(),
                                                        orderID:
                                                            generateUniqueId(),
                                                        name: userdata
                                                            .userdata.name,
                                                        mobileNO: contactpage
                                                            .mobile.text
                                                            .trim(),
                                                        houseNo: contactpage
                                                            .houseNo.text
                                                            .trim(),
                                                        roadNo: contactpage
                                                            .roadNo.text
                                                            .trim(),
                                                        thana: contactpage
                                                            .thana.text
                                                            .trim(),
                                                        city: contactpage
                                                            .city.text
                                                            .trim(),
                                                        deliveryDateTime: (datepage
                                                                .deliveryDate +
                                                            datepage
                                                                .deliveryTime),
                                                        pickupDateTime: (datepage
                                                                .pickupDate +
                                                            datepage
                                                                .pickupTime),
                                                        listOfCloths:
                                                            ordercounter
                                                                .itemCounters,
                                                        totalBill: ordercounter
                                                            .amountAfterDeliveryChargeAdded()
                                                            .toString(),
                                                        paymentMethod: "Card",
                                                        paymentStatus: "Paid",
                                                      );
                                                      paymentpage.addOrder(
                                                          userdata.user!.uid,
                                                          order.toMap());
                                                    }
                                                  }
                                                  if (paymentpage.cod) {
                                                    OrderDetails order =
                                                        OrderDetails(
                                                      orderStatus: "picking up",
                                                      paymentID:
                                                          generateTransactionId(),
                                                      orderID:
                                                          generateUniqueId(),
                                                      name: userdata
                                                          .userdata.name,
                                                      mobileNO: contactpage
                                                          .mobile.text
                                                          .trim(),
                                                      houseNo: contactpage
                                                          .houseNo.text
                                                          .trim(),
                                                      roadNo: contactpage
                                                          .roadNo.text
                                                          .trim(),
                                                      thana: contactpage
                                                          .thana.text
                                                          .trim(),
                                                      city: contactpage
                                                          .city.text
                                                          .trim(),
                                                      deliveryDateTime: (datepage
                                                              .deliveryDate +
                                                          datepage
                                                              .deliveryTime),
                                                      pickupDateTime: (datepage
                                                              .pickupDate +
                                                          datepage.pickupTime),
                                                      listOfCloths: ordercounter
                                                          .itemCounters,
                                                      totalBill: ordercounter
                                                          .amountAfterDeliveryChargeAdded()
                                                          .toString(),
                                                      paymentMethod:
                                                          "Cash on delivery",
                                                      paymentStatus: "not paid",
                                                    );
                                                    paymentpage.addOrder(
                                                        userdata.user!.uid,
                                                        order.toMap());
                                                  }

                                                  if (_value < 1) {
                                                    _value += 0.25;
                                                  }

                                                  if (currentIndex < 4) {
                                                    currentIndex += 1;
                                                  }
                                                },
                                                child: const Text("Proceed"),
                                              );
                                            });
                                          });
                                        });
                                      });
                                    }),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      );
    });
  }
}
