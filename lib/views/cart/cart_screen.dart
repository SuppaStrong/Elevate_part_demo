import 'package:elevate_ecommerce/controllers/cart/cart_controller.dart';
import 'package:elevate_ecommerce/views/cart/components/body.dart';
import 'package:elevate_ecommerce/views/cart/components/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Obx(() {
        if (cartController.productsMap.isEmpty) {
          return const EmptyCartScreen();
        } else {
          return Body(
            cartController: cartController,
          );
        }
      }),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: TextButton(
        child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () {
          Get.back();
        },
      ),
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              cartController.clearAllProducts();
            },
            child: const Icon(
              Icons.delete_outline,
              color: Colors.black,
            ))
      ],
    );
  }
}
