import 'package:flutter/material.dart';

import '../../../constants.dart';

class TotalBalance extends StatelessWidget {
  const TotalBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Text(
          'TOTAL BALANCE',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 145, 150, 178),
              letterSpacing: 0.6),
        ),
        Text('\$5,476.89',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
              height: 1.4,
            )),
      ]),
    );
  }
}
