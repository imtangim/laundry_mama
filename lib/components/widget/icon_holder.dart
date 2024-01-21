import 'package:flutter/material.dart';
import 'package:laundry_mama_rework/utils/color.dart';

class IconHolder extends StatelessWidget {
  final int currentIndex;
  final IconData iconData;
  const IconHolder({
    super.key,
    required this.indicator,
    required this.completeColor,
    required this.incompleteColor,
    required this.currentIndex,
    required this.iconData,
  });

  final bool indicator;
  final Color completeColor;
  final Color incompleteColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: indicator == true ? completeColor : incompleteColor,
          border: Border.all(color: CustomAsset.primaryColor)),
      child: Icon(
        iconData,
        color: indicator == true ? incompleteColor : completeColor,
      ),
    );
  }
}
