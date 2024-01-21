import 'package:flutter/material.dart';

class ServiceCircle extends StatelessWidget {
  final String label;
  final String imagePath;

  const ServiceCircle({
    super.key,
    required this.label,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color.fromRGBO(46, 68, 151, 1),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(
                imagePath,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
