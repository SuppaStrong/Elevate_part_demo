import 'dart:convert';
import 'package:elevate_ecommerce/models/payments/payments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:pay/pay.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  Map<String, dynamic>? paymentIntentData;

  String collecttion = "payments";
  String url = "";
  List<PaymentsModel> payments = [];
 

  var phoneNumber = ''.obs;
  var phoneNumber2 = ''.obs;
  var address = 'Your Address'.obs;
  var paymentItems = <PaymentItem>[].obs; 

  
  //Location

  Future<void> updatePosition() async {
    Position position = await _determinePosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks[0];

    address.value =
        "${place.name} , ${place.street} , ${place.subAdministrativeArea} , Hà Nội";
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

//Google Pay

  void makeGooglePay({required String amount, required String label}) {
    paymentItems.add(
      PaymentItem(
        label: label,
        amount: amount,
        status: PaymentItemStatus.final_price,
      ),
    );

    update();
  }

  void removeGooglePay() {
    paymentItems.clear();
    update();
  }

  // Stripe pay
  Future<void> stripePayment(
      {required String amount, required String currency}) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          // applePay: true,
          // googlePay: true,
          // testEnv: true,
          // merchantCountryCode: 'US',
          merchantDisplayName: 'Prospects',
          customerId: paymentIntentData!['customer'],
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
        ));
        displayPaymentSheet();
      }
    } catch (e, s) {
      // ignore: avoid_print
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      Get.snackbar('Payment', 'Payment Successful',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2));
    } on Exception catch (e) {
      if (e is StripeException) {
        // ignore: avoid_print
        print("Error from Stripe: ${e.error.localizedMessage}");
      } else {
        // ignore: avoid_print
        print("Unforeseen error: $e");
      }
    } catch (e) {
      // ignore: avoid_print
      print("exception:$e");
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51Ls9njDQKUM4zXrL0i2JCmaobHebqUgmNcyOw8VUxGYP1kvClzYwi6kxm0WqkEkgWzXKgwRCQdPXfE80tSq1cvfD00aL32TYB6',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (double.parse(amount)) * 100;
    final b = a.toInt();
    return b.toString();
  }
}
