import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  const BankCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 300,
            height: 190,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                offset: const Offset(0, 25),
                blurRadius: 30,
                color: const Color.fromARGB(255, 203, 30, 255).withOpacity(0.45),
              )
            ]),
          ),
        ),
        Image.asset(
          'assets/images/bankcard2.png',
        ),
      ]),
    );
  }
}
