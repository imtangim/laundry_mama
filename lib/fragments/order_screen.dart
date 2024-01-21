import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/components/widget/background_common.dart';
import 'package:laundry_mama_rework/components/widget/order_progress_bar.dart';
import 'package:laundry_mama_rework/fragments/complete.dart';
import 'package:laundry_mama_rework/fragments/list.dart';
import 'package:laundry_mama_rework/fragments/locationadress.dart';
import 'package:laundry_mama_rework/fragments/payment_failed.dart';
import 'package:laundry_mama_rework/fragments/payments.dart';
import 'package:laundry_mama_rework/fragments/pic_date.dart';
import 'package:laundry_mama_rework/utils/color.dart';
import 'package:laundry_mama_rework/utils/payment_controller.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  double _value = 0;
  Color completeColor = CustomAsset.primaryColor;
  Color incompleteColor = CustomAsset.foregroundColor;
  int currentIndex = 0;
  bool completeIndicator = false;
  int status = 300;
  var paymentObject = PaymentController();
  @override
  void initState() {
    super.initState();
  }

  Future<void> _makePayment() async {
    dynamic result = await paymentObject.makePayment(
      amount: "10",
      currency: "USD",
    );

    if (result["Status"] == 200) {
      if (_value == 1) {
        completeIndicator = true;
        status = 200;
      }
    } else if (result["Status"] == 400) {
      completeIndicator = false;
      status = 400;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(46, 68, 151, 1),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: status == 200 ? false : true,
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
          child: Stack(
            children: [
              const BackgroundCommon(),
              Column(
                mainAxisAlignment: currentIndex == 4
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  if (status != 200)
                    OrderProgressBar(
                      value: _value,
                      indicator: completeIndicator,
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
                    status == 300
                        ? const CircularProgressIndicator()
                        : status == 400
                            ? const PaymentFailed(
                                status: 400,
                                text: "Payment",
                              )
                            : status == 200
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
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (currentIndex < 4)
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(context.width * 0.4, 30),
                                  backgroundColor: CustomAsset.primaryColor,
                                  foregroundColor: CustomAsset.foregroundColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  if (_value > 0) {
                                    _value -= 0.25;
                                  }
                                  if (_value < 1) {
                                    completeIndicator = false;
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
                                  fixedSize: Size(context.width * 0.4, 30),
                                  backgroundColor: CustomAsset.primaryColor,
                                  foregroundColor: CustomAsset.foregroundColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  if (_value < 1) {
                                    _value += 0.25;
                                  }
                                  if (_value == 1) {
                                    completeIndicator = true;
                                  }
                                  if (currentIndex < 4) {
                                    currentIndex += 1;
                                  }

                                  setState(() {});
                                },
                                child: const Text("Next"),
                              ),
                            if (currentIndex == 3)
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(context.width * 0.4, 30),
                                  backgroundColor: CustomAsset.primaryColor,
                                  foregroundColor: CustomAsset.foregroundColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () async {
                                  _makePayment();

                                  setState(() {});
                                  log(status.toString());

                                  // Additional logic if payment is successful
                                  if (_value < 1) {
                                    _value += 0.25;
                                  }
                                  if (status == 200) {
                                    completeIndicator = true;
                                  }
                                  if (currentIndex < 4) {
                                    currentIndex += 1;
                                  }

                                  // Update the UI
                                  setState(() {});
                                },
                                child: const Text("Proceed"),
                              ),
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
          ),
        ),
      ),
    );
  }
}
