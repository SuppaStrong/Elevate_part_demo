import 'package:elevate_ecommerce/controllers/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfilePic extends StatelessWidget {
  ProfilePic({
    Key? key,
  }) : super(key: key);
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 10),
                  //spreadRadius: 10,
                  blurRadius: 20,
                  color: const Color.fromARGB(255, 1, 8, 199).withOpacity(0.25),
                ),
              ],
            ),
          ),
          Obx(() => CircleAvatar(
              backgroundImage: authController.displayUserPhoto.value == ""
                  ? const NetworkImage(
                      "https://media.istockphoto.com/vectors/letter-e-design-vector-in-blue-green-gradient-vector-id1168197279?k=20&m=1168197279&s=612x612&w=0&h=4Btb50rdyd1WZNkjmBwErhtIWSDKBtciQmVPQEUw0R8=")
                  : NetworkImage(
                      authController.displayUserPhoto.value,
                    ))),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
