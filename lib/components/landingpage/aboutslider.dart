import 'package:flutter/material.dart';

class AboutUsLnadingSlider extends StatelessWidget {
  const AboutUsLnadingSlider({
    super.key,
    required this.context,
    required this.img,
    required this.title,
  });

  final BuildContext context;
  final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /* For OnBoard All Image */
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(50),
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('asset/images/$img.png'))),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 25,
                fontFamily: 'roboto',
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Text(
            "We are professionals in the laundry and dry cleaning business, which means we always stay up to date on the latest technologies, cleaning methods, and solutions for dealing with stains or delicate fabrics!",
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
