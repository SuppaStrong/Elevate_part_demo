import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/controllers/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_menu_list.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: 400,
        color: const Color.fromARGB(255, 219, 227, 255),
      ),
      SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 72),
            ProfilePic(),
            const SizedBox(height: 16),
            Obx(() => Text(
                  authController.displayUserName.value,
                  style: heading2,
                  //TextStyle(color: Colors.black, fontSize: 24,),
                )),
            const SizedBox(height: 4),
            Obx(() => Text(authController.displayUserEmail.value,
                style: TextStyle(color: Colors.black.withOpacity(0.6)))),
            const SizedBox(height: 16),
            ProfileMenuList(),
          ],
        ),
      ),
    ]);
  }
}
