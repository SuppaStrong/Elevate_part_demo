import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/shared/widgets/default_button.dart';
import 'package:elevate_ecommerce/views/payment_mode/components/payment_method_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentModeScreen extends StatelessWidget {
  const PaymentModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: TextButton(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text("Payment", style: TextStyle(fontSize: 18)),
      ),
      body: ListView(
        children: [
          SizedBox(
            child: Image.asset(
              'assets/images/payment.png',
              width: 200,
              height: 200,
            ),
          ),

          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(24),
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
                  paymentNameTitle: "Cash On Delivery",
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
                  onTap: () {},
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: DefaultButton(
          text: "Continue",
          press: () {},
        ),
      ),
    );
    
  }
}
