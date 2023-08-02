import 'package:elevate_ecommerce/views/my_order/components/filter.dart';
import 'package:elevate_ecommerce/views/my_order/components/orders.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Stack(children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 60),
          child: OrdersList(),
        ),
        Filter(),
      ]),
    );
  }
}
