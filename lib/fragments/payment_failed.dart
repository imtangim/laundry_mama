import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/screen/dashboard.dart';
import 'package:laundry_mama_rework/utils/color.dart';

class PaymentFailed extends StatelessWidget {
  const PaymentFailed({super.key, required this.text, required this.status});

  final String text;
  final int status;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: context.height * 0.3,
        width: context.width * 0.7,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: status == 200
              ? const LinearGradient(
                  colors: [Color(0xffb4beee), Color(0xff3f5efb)],
                  stops: [0.25, 0.75],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                )
              : const LinearGradient(
                  colors: [Color(0xffa80000), Color(0xff3f5efb)],
                  stops: [0.25, 0.75],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
          // color: CustomColors.primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: CustomAsset.foregroundColor,
                minRadius: 30,
                child: const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Payment Failed",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomAsset.primaryColor,
                  foregroundColor: CustomAsset.foregroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Dashboard(),
                      ),
                      (route) => false);
                },
                child: const Text("Go to cart"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
