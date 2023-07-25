import 'package:flutter/material.dart';

import 'filter.dart';
import 'orders.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: const [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 60),
          child: OrdersList(),
        ),
        Filter(),
      ]),
    );
  }
}
