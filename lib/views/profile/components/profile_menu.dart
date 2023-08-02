import 'package:elevate_ecommerce/constants.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kPrimaryColor,
          //padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          //backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: ListTile(
          visualDensity: const VisualDensity(
            horizontal: -4,
            vertical: -2,
          ),
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            icon,
            color: kPrimaryColor,
          ),
          title: Text(text),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
