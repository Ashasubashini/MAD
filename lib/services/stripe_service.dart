import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:week2/const.dart';


class StripeService{
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment() async {
    try {
      String? payemtIntentClientSecret = await createPaymentIntent(10, "usd");
      if (payemtIntentClientSecret == null) return;
      await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: payemtIntentClientSecret,
        merchantDisplayName: "Asha",
      ),
      );
      await processPayment();
    }
    catch(e){
      print(e);

    }
  }
  Future<String?> createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount": calculateAmount(amount),
        "currency": currency,
      };
      var response = await dio.post("curl https://api.stripe.com/v1/payment_intents", data: data,
      options: Options(contentType: Headers.formUrlEncodedContentType,
        headers: {
          "Authorization": "Bearer $stripeSecretKey",
          "Content-Type" : 'application/x-www-form-urlencoded'
        },
      )
      );
      if (response.data != null) {
        return response.data["client_secret"];
      }
      return null;
    }
    catch(e){
      print(e);
    }
    return null;
  }
  Future<void> processPayment() async{
    try {
      await Stripe.instance.presentPaymentSheet();
    }
    catch(e){
      print(e);
    }
  }
  String calculateAmount(int amount){
    final calculatedAmount = amount * 100;
    return calculatedAmount.toString();
  }
}