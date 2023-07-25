import 'package:flutter/material.dart';

import 'components/body.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.shopping_bag_outlined),
          )
        ],
        title: const Text("Wallet", style: TextStyle(fontSize: 18)),
        foregroundColor: Colors.black,
      ),
      body: const Body(),
      
    );
  }
}
