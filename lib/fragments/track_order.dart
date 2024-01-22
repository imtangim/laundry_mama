import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/controller/order_cart_controller.dart';
import 'package:laundry_mama_rework/controller/signin_and_up_controller.dart';
import 'package:laundry_mama_rework/models/order.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class TrackOrderFragment extends StatefulWidget {
  const TrackOrderFragment({super.key});

  @override
  State<TrackOrderFragment> createState() => _TrackOrderFragmentState();
}

class _TrackOrderFragmentState extends State<TrackOrderFragment> {
  Future<void> _showAlertDialog(
      String name,
      String mobNo,
      String orderNo,
      String payID,
      String paymethod,
      String pickdate,
      String bill,
      String status) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.amber,
            ),
            height: context.height * 0.6,
            width: context.width * 0.9,
            child: Column(
              children: [
                OrderBox(
                  orderStatus: status,
                  name: name,
                  mobileNo: mobNo,
                  orderNo: orderNo,
                  paymentID: payID,
                  paymentMethod: paymethod,
                  pickupTime: pickdate,
                  totalBill: bill,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Done"),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignInAndUpController>(builder: (userData) {
        return GetBuilder<OrderCounterController>(builder: (controller) {
          return FutureBuilder(
              future: controller.getUserOrders(userData.userdata.uid),
              builder: (context, data) {
                if (data.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (data.hasError) {
                  return Text('Error: ${data.error}');
                } else {
                  List<OrderDetails> orders = data.data!;
                  log(orders.length.toString());
                  return ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        OrderDetails order = orders[index];
                        String firstThreeCharacters =
                            order.orderID.substring(0, 3);
                        String lastTwoCharacters =
                            order.orderID.substring(order.orderID.length - 2);

                        String adjustedString =
                            "$firstThreeCharacters-$lastTwoCharacters";

                        String firstThreeCharacterspPaymentID =
                            order.paymentID.substring(0, 3);
                        String lastTwoCharacterspPaymentID = order.paymentID
                            .substring(order.paymentID.length - 2);

                        String adjustedStringpPaymentID =
                            "$firstThreeCharacterspPaymentID-$lastTwoCharacterspPaymentID";

                        String adjustedDateTime =
                            "${order.pickupDateTime.substring(0, 8)}"
                            " ${order.pickupDateTime.substring(8, order.pickupDateTime.length)}";
                        return ListTile(
                          leading: SizedBox(
                            width: 50,
                            child: CircleAvatar(
                              minRadius: 30,
                              backgroundColor: order.orderStatus == "delivered"
                                  ? Colors.green
                                  : Colors.amber,
                              child: Icon(
                                order.orderStatus == "delivered"
                                    ? Icons.done
                                    : Icons.delivery_dining_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          onTap: () {
                            // String name,
                            // String mobNo,
                            // String orderNo,
                            // String payID,
                            // String paymethod,
                            // String pickdate,
                            // String bill,
                            // String status
                            _showAlertDialog(
                              order.name,
                              order.mobileNO,
                              adjustedString,
                              adjustedStringpPaymentID,
                              order.paymentMethod,
                              adjustedDateTime,
                              order.totalBill,
                              order.orderStatus,
                            );
                          },
                          title: Text("Order ID: $adjustedString"),
                          subtitle:
                              Text("Payment ID:$adjustedStringpPaymentID"),
                          trailing: SizedBox(
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${order.listOfCloths.keys.length.toString()} Cloths",
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                Text(
                                  "${order.totalBill} Taka",
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }
              });
        });
      }),
    );
  }
}

class OrderBox extends StatelessWidget {
  const OrderBox({
    super.key,
    required this.orderNo,
    required this.name,
    required this.mobileNo,
    required this.totalBill,
    required this.paymentID,
    required this.paymentMethod,
    required this.pickupTime,
    required this.orderStatus,
  });

  final String orderNo;
  final String name;
  final String mobileNo;
  final String totalBill;
  final String paymentID;
  final String paymentMethod;
  final String pickupTime;
  final String orderStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 413,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LeftColumn(),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            orderNo,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(fontSize: 14.5),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            name,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(fontSize: 14.5),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            mobileNo,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(fontSize: 14.5),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            totalBill,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(fontSize: 14.5),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            paymentID,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(fontSize: 14.5),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            paymentMethod,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(fontSize: 14.5),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            orderStatus,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(fontSize: 14.5),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pickup time: ",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontSize: 14.5),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      pickupTime,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontSize: 14.5),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: -110,
            bottom: 20,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: SfBarcodeGenerator(
                    value: orderNo.toString(),
                    symbology: QRCode(inputMode: QRInputMode.alphaNumeric),
                  ),
                ),
                Text(
                  "Scan for recipt",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LeftColumn extends StatelessWidget {
  const LeftColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Order No.",
          style:
              Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 14.5),
        ),
        const SizedBox(
          height: 10,
        ),
        Text("Name",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontSize: 14.5)),
        const SizedBox(
          height: 10,
        ),
        Text("Mobile No.",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontSize: 14.5)),
        const SizedBox(
          height: 10,
        ),
        Text("Total Bill",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontSize: 14.5)),
        const SizedBox(
          height: 10,
        ),
        Text("Payment ID",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontSize: 14.5)),
        const SizedBox(
          height: 10,
        ),
        Text("Payment Method",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontSize: 14.5)),
        const SizedBox(
          height: 10,
        ),
        Text("Order Status",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontSize: 14.5))
      ],
    );
  }
}
