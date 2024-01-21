import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/utils/color.dart';

class LocationAddress extends StatelessWidget {
  const LocationAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ContactDetailsPart(),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Address",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: context.width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  constraints: const BoxConstraints(maxHeight: 50),
                  hintText: "House No.",
                  filled: true,
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: CustomAsset.primaryColor,
                    ),
                  ),
                  fillColor: const Color.fromARGB(179, 231, 229, 229),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: CustomAsset.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: context.width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  constraints: const BoxConstraints(maxHeight: 50),
                  hintText: "Road No.",
                  filled: true,
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: CustomAsset.primaryColor,
                    ),
                  ),
                  fillColor: const Color.fromARGB(125, 231, 229, 229),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: CustomAsset.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: context.width * 0.9,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        constraints: const BoxConstraints(maxHeight: 50),
                        hintText: "Thana",
                        filled: true,
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: CustomAsset.primaryColor,
                          ),
                        ),
                        fillColor: const Color.fromARGB(125, 231, 229, 229),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: CustomAsset.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        constraints: const BoxConstraints(maxHeight: 50),
                        hintText: "City",
                        filled: true,
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: CustomAsset.primaryColor,
                          ),
                        ),
                        fillColor: const Color.fromARGB(125, 231, 229, 229),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: CustomAsset.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: context.width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  constraints: const BoxConstraints(maxHeight: 50),
                  hintText: "Recomendation (Optional)",
                  filled: true,
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: CustomAsset.primaryColor,
                    ),
                  ),
                  fillColor: const Color.fromARGB(125, 231, 229, 229),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: CustomAsset.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        )
      ],
    );
  }
}

class ContactDetailsPart extends StatelessWidget {
  const ContactDetailsPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact Details",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: context.width * 0.9,
          child: TextField(
            decoration: InputDecoration(
              constraints: const BoxConstraints(maxHeight: 50),
              hintText: "Name",
              filled: true,
              enabled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: CustomAsset.primaryColor,
                ),
              ),
              fillColor: const Color.fromARGB(179, 231, 229, 229),
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: CustomAsset.primaryColor,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: context.width * 0.9,
          child: Row(
            children: [
              Flag.fromCode(FlagsCode.BD, height: 30, width: 30),
              const SizedBox(
                width: 5,
              ),
              Text(
                "+880",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    constraints: const BoxConstraints(maxHeight: 50),
                    hintText: "Mobile Number",
                    hintMaxLines: 1,
                    filled: true,
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: CustomAsset.primaryColor,
                      ),
                    ),
                    fillColor: const Color.fromARGB(125, 231, 229, 229),
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: CustomAsset.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
