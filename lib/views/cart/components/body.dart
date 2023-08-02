import 'package:elevate_ecommerce/controllers/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.cartController,
  }) : super(key: key);
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.separated(
        itemCount: cartController.productsMap.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              cartController.removeOneProduct(
                  cartController.productsMap.keys.toList()[index]);
            },
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.red.shade400,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Row(
                children: [
                  Spacer(),
                  Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                    size: 28,
                  ),
                ],
              ),
            ),
            child: CartCard(
              index: index,
              productModel: cartController.productsMap.keys.toList()[index],
              quantity: cartController.productsMap.values.toList()[index],
            ),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 8,
          );
        },
      ),
    );
  }
}
