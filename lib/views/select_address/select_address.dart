import 'package:elevate_ecommerce/shared/widgets/default_button.dart';
import 'package:elevate_ecommerce/views/select_address/components/delivery_address_pick.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectAddressScreen extends StatelessWidget {
  const SelectAddressScreen({Key? key}) : super(key: key);

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
        title: const Text("Shipping Address", style: TextStyle(fontSize: 18)),
      ),
      body: ListView(
        children: [
          SizedBox(
            child: Image.asset(
              'assets/images/location.png',
              width: 200,
              height: 200,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: DeliveryContainerWidget(),
          ),
          // const Spacer(flex: 1,),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: DefaultButton(
          text: "Continue",
          press: () {
            Get.toNamed("/payment");
          },
        ),
      ),
    );
  }
}
