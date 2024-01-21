import 'dart:convert';
import 'dart:developer';

import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:http/http.dart' as http;

class PaymentController {
  Map<String, dynamic>? paymentIntentData;

  Future<Map> makePayment(
      {required String amount, required String currency}) async {
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
        Future<Map> response = displayPaymentSheet();
        log(paymentIntentData.toString());
        return response;
      } else {
        throw Exception();
      }
    } catch (e, s) {
      log("Exception: $e $s");
      return {"Status": 400, "message": "faled"};
    }
  }

  Future<Map> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      log("Payment successfull");
      return {"Status": 200, "message": "success"};
    } on Exception catch (e) {
      if (e is StripeException) {
        log("Errror from stripe: ${e.error.localizedMessage}");
        return {"Status": 400, "message": "${e.error.localizedMessage}"};
      } else {
        log("Unforeseen error: $e");
        return {"Status": 400, "message": "$e"};
      }
    } catch (e) {
      log("exception: $e");
      return {"Status": 400, "message": "$e"};
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
