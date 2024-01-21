import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            width: context.width * 0.8,
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
      body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const SizedBox(
                width: 50,
                child: CircleAvatar(
                  minRadius: 30,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.done,
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
                  "Tangim",
                  "01610006484",
                  "#4571552",
                  "#6485852d",
                  "Card",
                  "12-12-12",
                  "500",
                  "Delivered",
                );
              },
              title: const Text("OrderID"),
              subtitle: const Text("TxnID"),
              trailing: SizedBox(
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "12 Cloths",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      "3000 Taka",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            );
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
      width: 300,
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
                    Column(
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
