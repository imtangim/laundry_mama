import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/MediaQuery/size.dart';
import 'package:laundry_mama_rework/components/widget/background_common.dart';
import 'package:laundry_mama_rework/controller/auth_page_controller.dart';
import 'package:laundry_mama_rework/controller/signin_and_up_controller.dart';
import 'package:laundry_mama_rework/fragments/sign_in_fragments.dart';
import 'package:laundry_mama_rework/fragments/sign_up_fragments.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final AuthPageController _authPageController = Get.find();
  final SignInAndUpController _signInController = Get.find();
  @override
  Widget build(BuildContext context) {
    final layout = AppLayout(context: context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          child: Stack(
            children: [
              const BackgroundCommon(),
              SafeArea(
                child: Container(
                  height: 165,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/images/logo_prev_ui.png'),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<AuthPageController>(
                      builder: (controller) => Container(
                        margin: const EdgeInsets.all(10),
                        height: context.height *
                            (controller.isSigninMode == true ? 0.35 : 0.58),
                        width: context.width * 0.95,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius:
                              BorderRadius.circular(layout.getHeight(10)),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: context.width / layout.getHeight(4),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top: 20,
                                ),
                                width: context.width * 0.45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      layout.getHeight(32)),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: layout.getHeight(10)),
                                      decoration: BoxDecoration(
                                        color: controller.isSigninMode == true
                                            ? Colors.indigo[700]
                                            : const Color.fromARGB(
                                                179, 207, 200, 200),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(32),
                                          bottomLeft: Radius.circular(32),
                                        ),
                                      ),
                                      child: TextButton(
                                        child: Text(
                                            'SIGNIN',
                                            style: Theme
                                                    .of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                    color: controller
                                                                .isSigninMode ==
                                                            true
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .onBackground
                                                        : Colors.black)),
                                        onPressed: () {
                                          if (controller.isSigninMode ==
                                              false) {
                                            controller.toggleMode();
                                          }
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(right: 20),
                                      decoration: BoxDecoration(
                                        color: controller.isSigninMode == false
                                            ? Colors.indigo[700]
                                            : const Color.fromARGB(
                                                179, 207, 200, 200),
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(32),
                                          bottomRight: Radius.circular(32),
                                        ),
                                      ),
                                      child: TextButton(
                                        child: Text('SIGNUP',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                    color:
                                                        controller.isSigninMode ==
                                                                false
                                                            ? Theme.of(context)
                                                                .colorScheme
                                                                .onBackground
                                                            : Colors.black)),
                                        onPressed: () {
                                          if (controller.isSigninMode == true) {
                                            controller.toggleMode();
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (controller.isSigninMode == true)
                              SignInFragments(layout: layout),
                            if (controller.isSigninMode == false)
                              SizedBox(
                                width: context.width,
                                child: SignUpFragments(layout: layout),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: const Color.fromRGBO(46, 68, 151, 1),
                          foregroundColor: (Colors.white)),
                      onPressed: () async {
                        _authPageController.isSigninMode == true
                            ? _signInController.signIn()
                            : _signInController.signIn();
                      },
                      child: GetBuilder<SignInAndUpController>(
                          builder: (controller) {
                        return controller.isLoading
                            ? SizedBox(
                                height: 10,
                                width: 10,
                                child: CircularProgressIndicator(
                                    backgroundColor:
                                        Theme.of(context).canvasColor),
                              )
                            : const Row(
                                children: [
                                  Text("Go On"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                  ),
                                ],
                              );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
