import 'package:elevate_ecommerce/controllers/auth/auth_controller.dart';
import 'package:elevate_ecommerce/shared/widgets/top_rounded_container.dart';
import 'package:elevate_ecommerce/views/profile/components/profile_menu.dart';
import 'package:elevate_ecommerce/views/profile/components/prolie_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileMenuList extends StatelessWidget {
  ProfileMenuList({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return TopRoundedContainer(
      color: Colors.white,
      child: Column(
        children: [
          ProfileMenu(
            text: "My Account",
            icon: Icons.account_circle_outlined,
            press: () {
              FirebaseAuth.instance.currentUser != null ||
                      GetStorage().read<bool>("auth") == true
                  ? Get.to(() => const ProfileDetailScreen())
                  : Get.toNamed("/signin");
            },
          ),
          ProfileMenu(
            text: "My Orders",
            icon: Icons.sticky_note_2_outlined,
            press: () {},
          ),
          ProfileMenu(
            text: "Language",
            icon: Icons.language,
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: Icons.settings_outlined,
            press: () {},
          ),
          Divider(
            indent: 20,
            endIndent: 20,
            color: Colors.grey.shade400,
          ),
          ProfileMenu(
            text: "Help Center",
            icon: Icons.help_outline,
            press: () {},
          ),
          ProfileMenu(
            text: "Terms & Conditions",
            icon: Icons.info_outline,
            press: () {},
          ),
          Divider(
            indent: 20,
            endIndent: 20,
            color: Colors.grey.shade400,
          ),
          ProfileMenu(
            text: "Log Out",
            icon: Icons.logout_outlined,
            press: () => authController.signOutFromApp(),
          ),
        ],
      ),
    );
  }
}
