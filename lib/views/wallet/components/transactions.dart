import 'package:flutter/material.dart';

import '../../../constants.dart';

class Transactions extends StatelessWidget {
  final bool? isRefund;
  const Transactions({Key? key, this.isRefund}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TRANSACTIONS',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                letterSpacing: 0.6),
          ),
          const SizedBox(height: 8),
          txTile(false),
          txTile(false),
          txTile(true),
          txTile(false),
          txTile(true),
          txTile(false),
        ],
      ),
    );
  }

  Widget txTile(bool isRefund) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      // dense: true,
      visualDensity: const VisualDensity(
        horizontal: 0,
        vertical: -2,
      ),
      leading: Container(
        padding: const EdgeInsets.all(8),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 244, 246, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          isRefund ? Icons.add_circle_outline : Icons.sticky_note_2_outlined,
          color: const Color.fromARGB(255, 141, 146, 205),
        ),
      ),
      title: Text(
        isRefund ? 'Refund' : 'Order #102',
        style: body16Bold,
      ),
      subtitle: const Text('12 October, 2022'),
      trailing: Text('\$100.26',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isRefund ? kGreenColor : kPrimaryColor,
            height: 1.4,
          )),
    );
  }
}
