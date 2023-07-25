import 'package:flutter/material.dart';

import 'components/body.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 224, 227, 255),
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.shopping_bag_outlined),
          )
        ],
        title: const Text("My Orders", style: TextStyle(fontSize: 18)),
        foregroundColor: Colors.black,
        //backgroundColor: Color.fromARGB(255, 244, 237, 255),
      ),
      body: const Body(),
    );
  }
}
