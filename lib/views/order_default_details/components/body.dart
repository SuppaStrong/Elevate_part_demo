import 'package:flutter/material.dart';
import 'order_details.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 8),
        child: OrderDetails(),
      ),
    );
  }
}
