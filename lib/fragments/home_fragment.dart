import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/components/widget/background_common.dart';
import 'package:laundry_mama_rework/fragments/order_screen.dart';
import 'package:laundry_mama_rework/utils/color.dart';

import '../components/widget/service_circle.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // Now you can use 'this' (which is the State) as the vsync for AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // ... other initialization code
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          animationController: _animationController,
          onClosing: () {},
          enableDrag: true,
          builder: (context) {
            return Container(
              margin: const EdgeInsets.all(20),
              height: 400,
              width: double.maxFinite,
              child: Column(
                children: [
                  Text(
                    "Select Desired Service",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 250,
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        ServiceButton(
                          icon: Icons.water,
                          label: "Wash Only",
                          pageName: OrderScreen(),
                        ),
                        Spacer(),
                        ServiceButton(
                          icon: Icons.iron,
                          label: "Iron Only",
                          pageName: OrderScreen(),
                        ),
                        Spacer(),
                        ServiceButton(
                          icon: Icons.invert_colors_on,
                          label: "Both",
                          pageName: OrderScreen(),
                        ),
                        Spacer(),
                        ServiceButton(
                          icon: Icons.dry_cleaning_outlined,
                          label: "Dry Wash",
                          pageName: OrderScreen(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ); // Replace with the actual content of your bottom sheet
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundCommon(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    height: 159,
                    child: Material(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      elevation: 5,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Best laundry service in Dhaka",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(fontSize: 20)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        "We assure your laundry delivered on time \nAnd customer satisfaction.",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(fontSize: 16)),
                                  ],
                                )),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'asset/images/bannerImg.png'))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "SERVICES",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: context.height * 0.4,
                        child: GridView(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          children: const [
                            ServiceCircle(
                                label: "Wash only",
                                imagePath: "asset/images/servicesImg.png"),
                            ServiceCircle(
                                label: "Iron only",
                                imagePath: "asset/images/iron only.png"),
                            ServiceCircle(
                                label: "Both",
                                imagePath: "asset/images/both.png"),
                            ServiceCircle(
                                label: "Dry clean",
                                imagePath: "asset/images/Dry_clean.png"),
                            ServiceCircle(
                                label: "Pickup",
                                imagePath: "asset/images/pickup.png"),
                            ServiceCircle(
                                label: "Delivery",
                                imagePath: "asset/images/delivery-man.png"),
                          ],
                        ),
                      ),
                    ],
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
                      _showBottomSheet(context);

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const OrderScreen(),
                      //   ),
                      // );
                    },
                    child: const Text("Place your order"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceButton extends StatelessWidget {
  const ServiceButton({
    super.key,
    required this.label,
    required this.icon,
    required this.pageName,
  });
  final String label;
  final IconData icon;
  final Widget pageName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.maxFinite, 50),
          backgroundColor: CustomAsset.primaryColor,
          foregroundColor: CustomAsset.foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => pageName,
            ),
          ).then((value) => Navigator.pop(context));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
