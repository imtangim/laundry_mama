import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/controller/datetime_controller.dart';
import 'package:laundry_mama_rework/utils/color.dart';
import 'package:laundry_mama_rework/utils/style.dart';
import 'package:laundry_mama_rework/controller/order_cart_controller.dart';

class PickDate extends StatefulWidget {
  const PickDate({super.key});

  @override
  State<PickDate> createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> {
  final DateController _cartController = Get.put(DateController());

  Future<void> _selectPickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1));

    if (pickedDate != null) {
      // Handle the selected date as needed
      String formattedDate = DateFormat('dd/MM/yy').format(pickedDate);

      _cartController.pickupDate = formattedDate;
      _cartController.uPdate();
    }
  }

  Future<void> _selectDeliveryDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now().add(const Duration(days: 1)),
        firstDate: DateTime.now().add(const Duration(days: 1)),
        lastDate: DateTime(DateTime.now().year + 1));

    if (pickedDate != null) {
      // Handle the selected date as needed
      String formattedDate = DateFormat('dd/MM/yy').format(pickedDate);

      _cartController.deliveryDate = formattedDate;
      _cartController.uPdate();
    }
  }

  Future<void> _selectPickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      // Handle the selected time as needed

      if (context.mounted) {
        _cartController.pickupTime = pickedTime.format(context);
        _cartController.uPdate();
      }
    }
  }

  Future<void> _selectDeliveryTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      // Handle the selected time as needed

      if (context.mounted) {
        _cartController.deliveryTime = pickedTime.format(context);
        _cartController.uPdate();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Pickup Date and time
          pickUpDateTime(context),
          const SizedBox(
            height: 30,
          ),
          //Delivery Date and time
          deliveryDateTime(context),
        ],
      ),
    );
  }

  Column deliveryDateTime(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Text(
            "Delivery Date and time",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: context.height * 0.2,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: CustomAsset.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _selectDeliveryDate(context);
                },
                child: Container(
                  height: 55,
                  width: context.width * 0.75,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(171, 255, 251, 251),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<DateController>(builder: (controller) {
                          return Text(
                            controller.deliveryDate != ""
                                ? controller.deliveryDate
                                : "Select Date",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                          );
                        }),
                        const Icon(Icons.calendar_month_outlined)
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _selectDeliveryTime(context);
                },
                child: Container(
                  height: 55,
                  width: context.width * 0.75,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(171, 255, 251, 251),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<DateController>(builder: (controller) {
                          return Text(
                            controller.deliveryTime != ""
                                ? controller.deliveryTime
                                : "Select time",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                          );
                        }),
                        const Icon(Icons.av_timer_rounded)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column pickUpDateTime(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Text(
            "Pickup Date and time",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: context.height * 0.2,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: CustomAsset.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _selectPickDate(context);
                },
                child: Container(
                  height: 55,
                  width: context.width * 0.75,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(171, 255, 251, 251),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<DateController>(builder: (controller) {
                          return Text(
                            controller.pickupDate != ""
                                ? controller.pickupDate
                                : "Select Date",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                          );
                        }),
                        const Icon(Icons.calendar_month_outlined)
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _selectPickTime(context);
                },
                child: Container(
                  height: 55,
                  width: context.width * 0.75,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(171, 255, 251, 251),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<DateController>(builder: (controller) {
                          return Text(
                            controller.pickupTime != ""
                                ? controller.pickupTime
                                : "Select Time",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                          );
                        }),
                      ],
                    ),
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
