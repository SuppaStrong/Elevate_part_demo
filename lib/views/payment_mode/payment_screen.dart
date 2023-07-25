import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/controllers/cart/cart_controller.dart';
import 'package:elevate_ecommerce/controllers/payment/payment_controller.dart';
import 'package:elevate_ecommerce/views/payment_mode/components/payment_method_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PaymentModeScreen extends StatelessWidget {
  PaymentModeScreen({Key? key}) : super(key: key);
  final paymentController = Get.find<PaymentController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: TextButton(
          child: SvgPicture.asset(
            "assets/icons/back_icon.svg",
            height: 15,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "PAYMENT MODE       ",
              style: heading2.copyWith(
                  color: Colors.white, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 0, 140, 255),
                Colors.pinkAccent,
              ],
            )),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CARDS",
                  style: body14Bold.copyWith(color: Colors.grey.shade700),
                ),
                PayMentCard(
                  onTap: () {},
                  isIcon: true,
                  paymentNameTitle: "Credit Card",
                ),
                PayMentCard(
                  onTap: () {},
                  isIcon: true,
                  paymentNameTitle: "Debit Card",
                ),
                const Divider(),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "CASH",
                  style: body14Bold.copyWith(color: Colors.grey.shade700),
                ),
                const SizedBox(
                  height: 8,
                ),
                PayMentCard(
                  onTap: () {},
                  isIcon: true,
                  paymentNameTitle: "Cash On Delevery",
                  icon: Icons.monetization_on_outlined,
                ),
                const Divider(),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "OTHER METHODS",
                  style: body14Bold.copyWith(color: Colors.grey.shade700),
                ),
                PayMentCard(
                  onTap: () {},
                  isIcon: false,
                  paymentNameTitle: "PayPal",
                  paymentMethodImage: "assets/images/Paypal.png",
                ),
                PayMentCard(
                  onTap: () {
                    paymentController.stripePayment(amount: "${cartController.total}", currency: "USD");
                  },
                  isIcon: false,
                  paymentNameTitle: "Stripe",
                  paymentMethodImage: "assets/images/Stripe.png",
                ),
              ],
            ),
          )
          // const Spacer(flex: 1,),
        ],
      ),
    );
  }
}
