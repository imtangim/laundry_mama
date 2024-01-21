
import 'package:flutter/material.dart';

class BackgroundCommon extends StatelessWidget {
  final Widget? child;
  const BackgroundCommon({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'asset/images/bg.png',
          ),
        ),
      ),
      child: child,
    );
  }
}