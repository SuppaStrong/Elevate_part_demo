import 'package:elevate_ecommerce/shared/widgets/top_rounded_container.dart';
import 'package:elevate_ecommerce/views/order_delivery_details/components/delivery_details.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'order_details.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(children: [
          Image.asset(
            'assets/images/map.png',
          ),
          SingleChildScrollView(
            //padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Column(children: [
              const SizedBox(height: 310),

              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, -10),
                      blurRadius: 30,
                      color: const Color.fromARGB(255, 61, 61, 158).withOpacity(0.15),
                    ),
                  ],
                ),
                child: TopRoundedContainer(
                  color: kPrimaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      DeliveryDetails(),
                      OrderDetails(),
                    ],
                  ),
                ),
              )
              // ),
            ]),
          ),
        ]),
      ),
    );
  }
}

