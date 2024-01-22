import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:laundry_mama_rework/controller/getx_binder.dart';
import 'package:laundry_mama_rework/controller/themecontroller.dart';
import 'package:laundry_mama_rework/firebase_options.dart';
import 'package:laundry_mama_rework/screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Stripe.publishableKey =
      'pk_test_51OaOgsHJx9evLC0mzzlhYl6mhdNzrw3dPjcblTW5jUhKRdphQy1RtVw8sS431FiMHh9YqGd54EXUeBZX0Q3aChjA00Jxm0fV5p';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController _themeController = Get.put(ThemeController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (controller) {
      return GetMaterialApp(
        initialBinding: GetxDependencyBinder(),
        title: 'Flutter Demo',
        theme: _themeController.currentTheme,
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            textTheme: const TextTheme(
              labelMedium: TextStyle(
                color: Colors.white,
              ),
            )
            /* dark theme settings */
            ),
        themeMode:
            controller.isDarkMode == true ? ThemeMode.dark : ThemeMode.light,
        home: Builder(
          builder: (context) {
            return const SplashScreen();
          },
        ),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
