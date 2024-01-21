import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/utils/color.dart';

class PickDate extends StatefulWidget {
  const PickDate({super.key});

  @override
  State<PickDate> createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> {
  String? _pickupDate;
  String? _pickupTime;
  String? _deliveryDate;
  String? _deliveryTime;

  Future<void> _selectPickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1));

    if (pickedDate != null) {
      // Handle the selected date as needed
      String formattedDate = DateFormat('dd/MM/yy').format(pickedDate);

      setState(() {
        _pickupDate = formattedDate;
      });
    }
  }

  Future<void> _selectDeliveryDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1));

    if (pickedDate != null) {
      // Handle the selected date as needed
      String formattedDate = DateFormat('dd/MM/yy').format(pickedDate);

      setState(() {
        _deliveryDate = formattedDate;
      });
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
        _pickupTime = pickedTime.format(context);
        setState(() {});
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
        _deliveryTime = pickedTime.format(context);
        setState(() {});
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
          deliveryDateTime(context)
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
                        Text(
                          _deliveryDate == null
                              ? "Select Date"
                              : _deliveryDate.toString(),
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
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
                        Text(
                          _deliveryTime == null
                              ? "Select time"
                              : _deliveryTime.toString(),
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
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
                        Text(
                          _pickupDate == null
                              ? "Select Date"
                              : _pickupDate.toString(),
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
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
                        Text(
                          _pickupTime == null
                              ? "Select time"
                              : _pickupTime.toString(),
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
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
}
