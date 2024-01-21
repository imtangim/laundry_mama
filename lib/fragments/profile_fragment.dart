import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/controller/signin_and_up_controller.dart';
import 'package:laundry_mama_rework/controller/themecontroller.dart';
import 'package:laundry_mama_rework/utils/color.dart';

class ProfileFragment extends StatefulWidget {
  const ProfileFragment({super.key, this.imageURL});
  final String? imageURL;

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  final ThemeController _themeController = Get.find<ThemeController>();
  final SignInAndUpController _signInController = Get.find();
  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            height: context.height * 0.68,
            width: context.width * 0.83,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    "Developer Info",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: context.width * 0.8,
                      child: Column(
                        children: [
                          ClipOval(
                            clipBehavior: Clip.antiAlias,
                            child: CircleAvatar(
                              maxRadius: 100,
                              child: Image(
                                image: CustomAsset.devPhoto,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Noman Hossain",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 18,
                                ),
                          ),
                          Text(
                            "Graduate,",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 17,
                                ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Computer Science and Engineering",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 15,
                                ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Daffodil International University",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 15,
                                ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            "zamal15-13934@diu.edu.bd",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 15,
                                ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Contact: +880 16321 68745",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 15,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          maximumSize: const Size(190, 50),
                          minimumSize: const Size(140, 50),
                          backgroundColor: CustomAsset.primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Close",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          HeaderHolder(
            imageURL: widget.imageURL,
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: CustomAsset.primaryColor,
                  radius: 20,
                  child: const Icon(
                    Icons.account_circle_outlined,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "My Account",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                subtitle: Text(
                  "Account details",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              GetBuilder<ThemeController>(builder: (controller) {
                return ListTile(
                  onTap: () => controller.toggleTheme(),
                  leading: CircleAvatar(
                    backgroundColor: CustomAsset.primaryColor,
                    radius: 20,
                    child: Icon(
                      controller.isDarkMode == true
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    "Theme Mode",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  subtitle: Text(
                    controller.isDarkMode == true ? "Dark mode" : "Light mode",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      controller.toggleTheme();
                      log(controller.isDarkMode.toString());
                    },
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                );
              }),
              ListTile(
                onTap: () {
                  _showAlertDialog();
                },
                leading: CircleAvatar(
                  backgroundColor: CustomAsset.primaryColor,
                  radius: 20,
                  child: const Icon(
                    Icons.developer_mode,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "About",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                subtitle: Text(
                  "Developer Details",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    _showAlertDialog();
                  },
                  icon: const Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomAsset.primaryColor,
                  foregroundColor: CustomAsset.foregroundColor,
                  minimumSize: Size(context.width * 0.8, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  _signInController.logout();
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderHolder extends StatelessWidget {
  const HeaderHolder({super.key, this.imageURL});
  final String? imageURL;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            clipBehavior: Clip.antiAlias,
            child: CircleAvatar(
              maxRadius: 100,
              child: imageURL != null
                  ? Image.network(
                      imageURL.toString(),
                      fit: BoxFit.contain,
                    )
                  : Image(
                      image: CustomAsset.defaultProfilePhoto,
                      fit: BoxFit.contain,
                    ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "MD Tangim Haque",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            "example@gmail.com",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 15,
                ),
          ),
        ],
      ),
    );
  }
}
