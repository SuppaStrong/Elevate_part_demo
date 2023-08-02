import 'package:elevate_ecommerce/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'constants.dart';

class MainHome extends StatelessWidget {
  MainHome({Key? key}) : super(key: key);
  final _homeController = Get.find<HomeController>();
  final List<dynamic> menuItems = [
    {
      //'icon': Icon(Icons.home_mini_outlined),
      'icon': 'assets/icons/home.svg',
      'label': 'Home',
    },
    {
      'icon': 'assets/icons/wallet.svg',
      //'icon': Icon(Icons.account_balance_wallet_outlined),
      'label': 'Wallet',
    },
    {
      'icon': 'assets/icons/heart.svg',
      // 'icon': Icon(Icons.favorite_border_outlined),
      'label': 'Favorites',
    },
    {
      'icon': 'assets/icons/box.svg',
      // 'icon': Icon(Icons.place_outlined),
      'label': 'Order',
    },
    {
      'icon': 'assets/icons/profile.svg',
      // 'icon': Icon(Icons.account_circle_outlined),
      'label': 'Profile',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: IndexedStack(
            index: _homeController.currentPage.value,
            children: _homeController.pages,
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            // height: 174,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -15),
                  blurRadius: 20,
                  color: const Color(0xFFDADADA).withOpacity(0.25),
                )
              ],
            ),
            child: SafeArea(
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                elevation: 0,
                showUnselectedLabels: true,
                currentIndex: _homeController.currentPage.value,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: kPrimaryColor,
                selectedLabelStyle: const TextStyle(
                  height: 1.5,
                  fontSize: 12,
                ),
                unselectedLabelStyle: const TextStyle(
                  height: 1.5,
                  fontSize: 12,
                ),
                items: menuItems.map((i) {
                  return BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      i['icon'],
                      color: Colors.grey.shade500,
                    ),
                    activeIcon: SvgPicture.asset(
                      i['icon'],
                      color: kPrimaryColor,
                    ),
                    label: i['label'],
                  );
                }).toList(),
                onTap: (index) {
                  _homeController.currentPage.value = index;
                },
              ),
            ),
          ),
        ));
  }
}
