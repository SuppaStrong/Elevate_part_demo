import 'package:flutter/material.dart';
import 'bank_card.dart';
import 'total_balance.dart';
import 'transactions.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const SizedBox(
        width: double.infinity,
        height: 400,
      ),
      SingleChildScrollView(
        //padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Column(children: const [
          TotalBalance(),
          SizedBox(height: 20),
          BankCard(),
          SizedBox(height: 32),
          Transactions(),
        ]),
      ),
    ]);
  }
}
