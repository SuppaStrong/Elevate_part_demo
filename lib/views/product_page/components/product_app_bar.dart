import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_ecommerce/controllers/cart/cart_controller.dart';
import 'package:elevate_ecommerce/models/products/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPageAppBar extends StatelessWidget {
  ProductPageAppBar({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.6,
      elevation: 0,
      snap: true,
      floating: true,
      stretch: true,
      //onStretchTrigger:(){},
      backgroundColor: Colors.white,

      leading: TextButton(
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Get.back();
        },
      ),
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
                icon: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.shopping_bag_outlined),
                )
                //SvgPicture.asset("assets/icons/Cart.svg"),
                )))
      ],
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const <StretchMode>[
          StretchMode.zoomBackground,
        ],
        background: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(60),
                child: CachedNetworkImage(
                  imageUrl: productModel.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(color: const Color.fromARGB(15, 79, 90, 254)),
          ],
        ),
        // background: Image.network(product.image, fit: BoxFit.cover,)
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: Transform.translate(
            offset: const Offset(0, 1),
            child: Container(
              height: 28,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(16, 58, 62, 188),
                    offset: Offset(0, -30),
                    blurRadius: 30,
                  )
                ],
              ),
              // child: Center(
              //     child: Container(
              //   width: 50,
              //   height: 8,
              //   decoration: BoxDecoration(
              //     color: kPrimaryColor,
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              // )),
            ),
          )),
    );
  }
}
