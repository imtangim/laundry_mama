import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laundry_mama_rework/components/landingpage/onboarding.dart';
import 'package:laundry_mama_rework/components/widget/background_common.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void openOnBoard() {
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
        (route) => false,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    openOnBoard();
  }

  late Size size;
  late double height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: BackgroundCommon(
        child: Center(
            child: Container(
          height: 300,
          width: 300,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'asset/images/washing-machine.png',
              ),
            ),
          ),
        )),
      ),
    );
  }
}
