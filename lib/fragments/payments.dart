import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/utils/color.dart';
import 'package:laundry_mama_rework/utils/payment_controller.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  bool _card = false;
  bool _cod = false;

  //strpie payment control

  var paymentObject = PaymentController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.maxFinite,
          height: context.height * 0.5,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: CustomAsset.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Summary",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const DressLabel(
                    dresslabel: "Service",
                    number: "Wash-Only",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const DressLabel(
                    dresslabel: "Total Cloth",
                    number: "18",
                  ),
                  const Divider(),
                  const DressLabel(
                    dresslabel: "Service Price",
                    number: "(18 * 15) Taka",
                  ),
                  const DressLabel(
                    dresslabel: "Delivery Charge",
                    number: "50 Taka",
                  ),
                  const Divider(),
                  const DressLabel(
                    dresslabel: "Discount",
                    number: "0 Taka",
                  ),
                  const Divider(),
                  const DressLabel(
                    dresslabel: "Total",
                    number: "5000 Taka",
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (_card) {
                    _cod = true;
                    _card = false;
                  } else {
                    _cod = true;
                  }
                  setState(() {});
                },
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: CustomAsset.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.green,
                        side: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        shape: const CircleBorder(
                          eccentricity: 0.5,
                        ),
                        value: _cod,
                        onChanged: (value) {
                          if (_card) {
                            _cod = true;
                            _card = false;
                          } else {
                            _cod = true;
                          }
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Cash on Delivery",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_cod) {
                    _card = true;
                    _cod = false;
                  } else {
                    _card = true;
                  }
                  setState(() {});
                },
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: CustomAsset.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.green,
                        side: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        shape: const CircleBorder(
                          eccentricity: 0.5,
                        ),
                        value: _card,
                        onChanged: (value) {
                          if (_cod) {
                            _card = true;
                            _cod = false;
                          } else {
                            _card = true;
                          }
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Pay with Cards/Bkash",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DressLabel extends StatelessWidget {
  const DressLabel({
    super.key,
    required this.dresslabel,
    required this.number,
  });
  final String dresslabel;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dresslabel,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 15,
                ),
          ),
          Text(
            number,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 15,
                ),
          ),
        ],
      ),
    );
  }
}
