import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/shared/widgets/default_button.dart';
import 'package:elevate_ecommerce/views/select_adress/components/delevery_adress_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SelectAddressScreen extends StatelessWidget {
  const SelectAddressScreen({Key? key}) : super(key: key);

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
              "ADDRESS      ",
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
              )
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
              press: (){
                Get.toNamed("/payment");
              },
            ),
          ),
    );
  }
}
