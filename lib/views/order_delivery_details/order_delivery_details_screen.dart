import 'package:flutter/material.dart';

import 'components/body.dart';

class OrderDeliveryDetailsScreen extends StatelessWidget {

  const OrderDeliveryDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 224, 227, 255),
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.more_horiz),
          )
        ],
        title: const Text("Order #10294756", style: TextStyle(fontSize: 18)),
        foregroundColor: Colors.black,
        //backgroundColor: Color.fromARGB(255, 244, 237, 255),
      ),
      body: const Body(),
    );
  }
}
