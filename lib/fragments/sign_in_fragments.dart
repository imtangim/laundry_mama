import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/MediaQuery/size.dart';
import 'package:laundry_mama_rework/controller/signin_and_up_controller.dart';

class SignInFragments extends StatelessWidget {
  const SignInFragments({
    super.key,
    required this.layout,
  });

  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: layout.getHeight(80)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SignInForm(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Text(
                "Forgot Password?",
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
  final SignInAndUpController _signInController = Get.find<SignInAndUpController>();
  SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome!",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<SignInAndUpController>(
            builder: (controller) {
              return TextField(
                controller: controller.emailController,
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
            }
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<SignInAndUpController>(
            builder: (controller) {
              return TextField(
                controller: controller.passwordController,
                obscureText: true,
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
            }
          ),
        ],
      ),
    );
  }
}
