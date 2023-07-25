import 'package:badges/badges.dart';
import 'package:elevate_ecommerce/controllers/cart/cart_controller.dart';
import 'package:elevate_ecommerce/controllers/home/home_controller.dart';
import 'package:elevate_ecommerce/views/home/components/product_card.dart';
import 'package:elevate_ecommerce/views/product_page/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  // final cartController = Get.find<CartController>();
  // final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(249, 251, 255, 0.95),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   actions: [
      //     Obx(() => Badge(
      //           position: BadgePosition.topEnd(top: 0, end: 3),
      //           animationDuration: const Duration(milliseconds: 300),
      //           animationType: BadgeAnimationType.fade,
      //           badgeContent: Text(
      //             cartController.quantity().toString(),
      //             style: const TextStyle(color: Colors.white),
      //           ),
      //           child: IconButton(
      //               onPressed: () => Get.toNamed("/cart"),
      //               icon: SvgPicture.asset(
      //                 "assets/icons/Cart.svg",
      //                 color: const Color.fromRGBO(51, 51, 51, 1),
      //               )),
      //         ))
      //   ],
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       SvgPicture.asset(
      //         "assets/icons/E.svg",
      //         color: const Color.fromRGBO(51, 51, 51, 1),
      //       ),
      //     ],
      //   ),
      // ),
      // body: Column(
      //   children: [
      //     Obx(() => Expanded(
      //           child: controller.favouritesList.isEmpty 
      //               ? Image.asset("assets/images/no_result.png")
      //               : GridView.builder(
      //                   gridDelegate:
      //                       const SliverGridDelegateWithFixedCrossAxisCount(
      //                     childAspectRatio: 1,
      //                     mainAxisSpacing: 20,
      //                     crossAxisSpacing: 4,
      //                     crossAxisCount: 2,
      //                   ),
      //                   itemCount: controller.favouritesList.length,
      //                   itemBuilder: (context, index) {
      //                     return ProductCard(
      //                         imagePath: controller.favouritesList[index].image,
      //                         productName: controller.favouritesList[index].title,
      //                         price: controller.favouritesList[index].price,
      //                         isFullCard: false,
      //                         onTap: () {
      //                           Get.to(() => ProductScreen(
      //                                 productModel:
      //                                     controller.favouritesList[index],
      //                               ));
      //                         });
      //                   },
      //                 ),
      //         )),
      //   ],
      // ),
    );
  }
}
