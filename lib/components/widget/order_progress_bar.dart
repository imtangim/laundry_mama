import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/components/widget/icon_holder.dart';
import 'package:laundry_mama_rework/utils/color.dart';

class OrderProgressBar extends StatelessWidget {
  const OrderProgressBar({
    super.key,
    required double value,
    required this.indicator,
    required this.completeColor,
    required this.incompleteColor,
    required this.currentIndex,
  }) : _value = value;

  final double _value;
  final bool indicator;
  final Color completeColor;
  final Color incompleteColor;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.height * 0.09,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: Center(
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
                color: indicator == false
                    ? Colors.green
                    : CustomAsset.primaryColor,
                value: _value,
              ),
            ),
          ),
          Positioned(
            top: 10,
            child: SizedBox(
              width: context.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconHolder(
                    indicator: indicator,
                    completeColor: completeColor,
                    incompleteColor: incompleteColor,
                    currentIndex: currentIndex,
                    iconData: Icons.list_alt_outlined,
                  ),
                  IconHolder(
                    indicator: indicator,
                    completeColor: completeColor,
                    incompleteColor: incompleteColor,
                    currentIndex: currentIndex,
                    iconData: Icons.date_range_outlined,
                  ),
                  IconHolder(
                    indicator: indicator,
                    completeColor: completeColor,
                    incompleteColor: incompleteColor,
                    currentIndex: currentIndex,
                    iconData: Icons.location_pin,
                  ),
                  IconHolder(
                    indicator: indicator,
                    completeColor: completeColor,
                    incompleteColor: incompleteColor,
                    currentIndex: currentIndex,
                    iconData: Icons.payment,
                  ),
                  IconHolder(
                    currentIndex: currentIndex,
                    indicator: indicator,
                    completeColor: completeColor,
                    incompleteColor: incompleteColor,
                    iconData: Icons.done,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
