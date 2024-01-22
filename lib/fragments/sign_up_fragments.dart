import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/MediaQuery/size.dart';
import 'package:laundry_mama_rework/controller/signin_and_up_controller.dart';

class SignUpFragments extends StatelessWidget {
  const SignUpFragments({
    super.key,
    required this.layout,
  });

  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: layout.getHeight(80)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SignInForm(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                "All ready have an accouts?",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 16,
                      color: Colors.indigo[700],
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GetBuilder<SignInAndUpController>(builder: (controller) {
          return Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Thank your for choosing us",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GetBuilder<SignInAndUpController>(
                          builder: (controller) {
                        return TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              controller.showSnackBar(
                                  'Please enter your First name', context);
                              return null;
                            }

                            return null;
                          },
                          controller: controller.firstName,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "First name",
                            filled: true,
                            enabled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.blueGrey,
                              ),
                            ),
                            fillColor: Color.fromARGB(179, 231, 229, 229),
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GetBuilder<SignInAndUpController>(
                          builder: (controller) {
                        return TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              controller.showSnackBar(
                                  'Please enter your Last name', context);
                              return null;
                            }

                            return null;
                          },
                          controller: controller.lastName,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Last name",
                            filled: true,
                            enabled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.blueGrey,
                              ),
                            ),
                            fillColor: Color.fromARGB(179, 231, 229, 229),
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<SignInAndUpController>(builder: (controller) {
                  return TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.showSnackBar(
                            'Please enter your email', context);
                        return null;
                      }

                      if (!controller.isEmailValid(value)) {
                        controller.showSnackBar(
                            'Please enter a valid email address', context);
                        return null;
                      }

                      return null;
                    },
                    controller: controller.signUpemailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      filled: true,
                      enabled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blueGrey,
                        ),
                      ),
                      fillColor: Color.fromARGB(179, 231, 229, 229),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<SignInAndUpController>(builder: (controller) {
                  return TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.showSnackBar(
                            'Please enter your address', context);
                        return null;
                      }

                      return null;
                    },
                    controller: controller.address,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.gps_fixed),
                      ),
                      hintText: "Address",
                      filled: true,
                      enabled: true,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blueGrey,
                        ),
                      ),
                      fillColor: const Color.fromARGB(179, 231, 229, 229),
                      border: const UnderlineInputBorder(),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<SignInAndUpController>(builder: (controller) {
                  return TextFormField(
                    controller: controller.signUppasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.showSnackBar(
                            'Please enter your password', context);
                        return null;
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Password",
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                      ),
                      filled: true,
                      enabled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blueGrey,
                        ),
                      ),
                      fillColor: Color.fromARGB(179, 231, 229, 229),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<SignInAndUpController>(builder: (controller) {
                  return TextFormField(
                    controller: controller.signUpConfirmpasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        controller.showSnackBar(
                            'Please confirm your password', context);
                        return null;
                      }
                      if (value != controller.signUppasswordController.text) {
                        log(value);
                        log(controller.passwordController.text);
                        log(controller.lastName.text);
                        log(controller.firstName.text);
                        log(controller.signUpemailController.text);
                        log(controller.emailController.text);
                        controller.showSnackBar(
                            'Password Do not match', context);
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Confirm Password",
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                      ),
                      filled: true,
                      enabled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blueGrey,
                        ),
                      ),
                      fillColor: Color.fromARGB(179, 231, 229, 229),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
