
import 'package:flutter/material.dart';

class PayMentCard extends StatelessWidget {
  const PayMentCard({Key? key, required this.onTap, required this.isIcon, this.icon = Icons.payment, this.paymentMethodImage = "", required this.paymentNameTitle}) : super(key: key);
  final Function onTap;
  final bool isIcon;
  final IconData icon;
  final String paymentMethodImage ;
  final String paymentNameTitle ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function(),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ListTile(
          selectedColor: Colors.grey.shade400,
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
              borderRadius: BorderRadius.circular(20),
            ),
            child: isIcon ? Icon(
              icon,
              color: const Color.fromARGB(255, 141, 146, 205),
            ) : Image.asset(paymentMethodImage, fit: BoxFit.contain,),
          ),
          title: Text(paymentNameTitle),
        ),
      ),
    );
  }
}
