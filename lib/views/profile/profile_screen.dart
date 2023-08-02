import 'package:badges/badges.dart' as badges;
import 'package:elevate_ecommerce/controllers/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        //iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
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
      ),
      body: Body(),
    );
  }
}
