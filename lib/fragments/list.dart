import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/components/widget/bttom_sheet.dart';
import 'package:laundry_mama_rework/controller/order_cart_controller.dart';
import 'package:laundry_mama_rework/models/product_model.dart';
import 'package:laundry_mama_rework/utils/color.dart';
import 'package:laundry_mama_rework/utils/service.dart';
import 'package:laundry_mama_rework/utils/style.dart';

class ListOfLaundry extends StatefulWidget {
  const ListOfLaundry({super.key});

  @override
  State<ListOfLaundry> createState() => _ListOfLaundryState();
}

class _ListOfLaundryState extends State<ListOfLaundry> {
  final List<Product> items = [];
  final OrderCounterController _cartController =
      Get.find<OrderCounterController>();

  @override
  void initState() {
    for (var i = 0; i < service.length; i++) {
      String name = service[i]["Cloth_name"];
      int count = 0;
      String price = service[i]["service_price"].toString();
      items.add(
        Product(name: name, totalCount: count, price: price),
      );
    }

//
    super.initState();
  }

  double _dragStartY = 0.0;
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const BottomSheetCart(); // Replace with the actual content of your bottom sheet
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.height * 0.56,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Product item = items[index];
              return GetBuilder<OrderCounterController>(builder: (controller) {
                return ProductSelection(
                  counter: controller.getCounterValue(item.name).toString(),
                  increment: () {
                    controller.incrementCounter(item.name);
                    log(controller.itemCounters.toString());
                    log(controller.totalAmount.toString());
                    log(controller.calculateAmount().toString());
                  },
                  decrement: () {
                    controller.decrementCounter(item.name);
                  },
                  name: service[index]["Cloth_name"],
                  price: service[index]["service_price"].toString(),
                );
              });
            },
            // separatorBuilder: (context, index) => const Divider(),
            itemCount: service.length,
          ),
        ),
        GestureDetector(
          onVerticalDragStart: (details) {
            _dragStartY = details.globalPosition.dy;
          },
          onVerticalDragUpdate: (details) {
            final deltaY = details.globalPosition.dy - _dragStartY;
            // Set a threshold to trigger the bottom sheet
            if (deltaY < -50.0) {
              _showBottomSheet(context);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: context.width,
            height: context.height * 0.15,
            child: Padding(
              padding: const EdgeInsets.all(18.10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_circle_up),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Slide up for details")
                    ],
                  ),
                  const Text(
                    "Your Cart",
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total item"),
                      GetBuilder<OrderCounterController>(builder: (controller) {
                        return Text(
                          "${controller.calculateSum(controller.itemCounters).toString()} Cloths",
                          style: const TextStyle(fontSize: 16),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class ProductSelection extends StatelessWidget {
  const ProductSelection({
    super.key,
    required this.price,
    required this.name,
    required this.increment,
    required this.decrement,
    required this.counter,
  });
  final String price;
  final String name;
  final Function() increment;
  final Function() decrement;
  final String counter;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: SizedBox(
        width: 50,
        child: CircleAvatar(
          radius: 50,
          child: Image.asset('asset/images/cloth9.png'),
        ),
      ),
      title: Text(
        name,
        style: CustomStyle.headingStyle,
      ),
      subtitle: Text(
        price,
        style: CustomStyle.headingStyle,
      ),
      trailing: SizedBox(
        width: context.width * 0.30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: decrement,
              child: CircleAvatar(
                backgroundColor: CustomAsset.primaryColor,
                foregroundColor: CustomAsset.foregroundColor,
                child: const Icon(
                  Icons.remove,
                  size: 30,
                ),
              ),
            ),
            Text(
              counter,
              style: CustomStyle.headingStyle.copyWith(fontSize: 20),
            ),
            GestureDetector(
              onTap: increment,
              child: CircleAvatar(
                backgroundColor: CustomAsset.primaryColor,
                foregroundColor: CustomAsset.foregroundColor,
                child: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
