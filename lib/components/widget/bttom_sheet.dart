import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/utils/style.dart';

class BottomSheetCart extends StatelessWidget {
  const BottomSheetCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 3,
          type: MaterialType.card,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: context.width,
            height: context.height * 0.32,
            child: Padding(
              padding: const EdgeInsets.all(18.10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Cart",
                    style: CustomStyle.headingStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total item",
                        style: CustomStyle.contentStyle.copyWith(fontSize: 18),
                      ),
                      Text(
                        "50 Items",
                        style: CustomStyle.contentStyle.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total amount",
                        style: CustomStyle.contentStyle,
                      ),
                      Text(
                        "(50 X 100) Taka",
                        style: CustomStyle.contentStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Charge",
                        style: CustomStyle.contentStyle,
                      ),
                      Text(
                        "50 Taka",
                        style: CustomStyle.contentStyle,
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(""),
                      Text(
                        "5000 Taka",
                        style: CustomStyle.contentStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Offer",
                        style: CustomStyle.contentStyle.copyWith(fontSize: 15),
                      ),
                      Text(
                        "( - )",
                        style: CustomStyle.contentStyle.copyWith(fontSize: 18),
                      ),
                      Text(
                        "50 Taka",
                        style: CustomStyle.contentStyle.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: CustomStyle.contentStyle.copyWith(fontSize: 18),
                      ),
                      Text(
                        "4950 Taka",
                        style: CustomStyle.contentStyle.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
