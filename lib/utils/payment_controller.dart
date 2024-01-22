import 'dart:convert';
import 'dart:developer';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  Map<String, dynamic>? paymentIntentData;

  bool? paymentSuccess;
  bool datafieldpage = true;
  bool isPaymentloading = true;

  Future<bool?> makePayment(
      {required String amount, required String currency}) async {
    isPaymentloading = true;
    update();
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            merchantDisplayName: "Laundry Mama",
            customerId: paymentIntentData!["customer"],
            paymentIntentClientSecret: paymentIntentData!["client_secret"],
            customerEphemeralKeySecret: paymentIntentData!["ephemeralKey"],
          ),
        );
        paymentSuccess = await displayPaymentSheet();
        log(paymentIntentData.toString());
        isPaymentloading = false;
        datafieldpage = false;
        update();
        return paymentSuccess;
      } else {
        throw Exception();
      }
    } catch (e, s) {
      log("Exception: $e $s");
      isPaymentloading = false;
      update();
      return paymentSuccess;
    }
  }

  Future<bool> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      log("Payment successfull");
      return true;
    } on Exception catch (e) {
      if (e is StripeException) {
        log("Errror from stripe: ${e.error.localizedMessage}");
        return false;
      } else {
        log("Unforeseen error: $e");
        return false;
      }
    } catch (e) {
      log("exception: $e");
      return false;
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        "amount": calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            'Authorization':
                "Bearer sk_test_51OaOgsHJx9evLC0mVqUGKtvWmwlv9rWc5EH7e6lE4LlCMoQixlVOhIatA4AIDVe5rD1nmjrMlOrKqMVRyTVG35ne00trvtyoLg",
            'Content-type': 'application/x-www-form-urlencoded'
          });
      log(response.body);
      return jsonDecode(response.body);
    } catch (e) {
      log("err charging user:${e.toString()}");
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
