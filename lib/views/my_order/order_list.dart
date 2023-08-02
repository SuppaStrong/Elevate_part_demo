import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:elevate_ecommerce/controllers/cart/cart_controller.dart';

class MyOrderScreen extends StatelessWidget {
   MyOrderScreen({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 224, 227, 255),
      appBar: AppBar(
        actions: [
          
          Obx(() => badges.Badge(
                position: badges.BadgePosition.topEnd(top: 0, end: 3),
                animationDuration: const Duration(milliseconds: 300),
                animationType: badges.BadgeAnimationType.fade,
                badgeContent: Text(
                  cartController.quantity().toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: IconButton(
                    onPressed: () => Get.toNamed("/cart"),
                    icon: const Icon(Icons.shopping_bag_outlined)),
              ))
        ],
        title: const Text("My Orders", style: TextStyle(fontSize: 18)),
        foregroundColor: Colors.black,
        //backgroundColor: Color.fromARGB(255, 244, 237, 255),
      ),
      body: const Body(),
    );
  }
}
