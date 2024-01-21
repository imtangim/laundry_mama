import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/controller/dashboard_controller.dart';
import 'package:laundry_mama_rework/fragments/home_fragment.dart';
import 'package:laundry_mama_rework/fragments/profile_fragment.dart';
import 'package:laundry_mama_rework/fragments/track_order.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardController _dashboardController =
      Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
        backgroundColor: const Color.fromRGBO(46, 68, 151, 1),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: GetBuilder<DashboardController>(
          builder: (controller) => Text(
            controller.barTitle[controller.currentPageIndex],
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
        ),
      ),
      extendBody: true,
      body: GetBuilder<DashboardController>(
        builder: (controller) => IndexedStack(
          index: controller.currentPageIndex,
          children: const [
            HomeFragment(),
            TrackOrderFragment(),
            // OfferFragment(),
            ProfileFragment()
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: GetBuilder<DashboardController>(
          builder: (controller) {
            return BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (value) {
                controller.changePageIndex(value);
              },
              backgroundColor: const Color.fromRGBO(46, 68, 151, 1),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
              currentIndex: controller.currentPageIndex,
              elevation: 2,
              unselectedFontSize: 0,
              iconSize: 30,
              selectedFontSize: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    size: 30,
                  ),
                  label: "Order",
                ),
                // BottomNavigationBarItem(
                //     icon: Icon(Icons.verified_outlined), label: "Offer"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined),
                    label: "Profile"),
              ],
            );
          },
        ),
      ),
    );
  }
}
