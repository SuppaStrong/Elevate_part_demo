import 'package:elevate_ecommerce/models/cart.dart';
import 'package:elevate_ecommerce/shared/widgets/outline_button.dart';
import 'package:elevate_ecommerce/shared/widgets/top_rounded_container.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -10),
            blurRadius: 20,
            color: const Color.fromARGB(255, 61, 61, 158).withOpacity(0.1),
          ),
        ],
      ),
      child: TopRoundedContainer(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ORDER DETAILS',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    letterSpacing: 0.4,
                  )),
              const SizedBox(height: 8),
              orderProducts(demoCarts[0]),
              orderProducts(demoCarts[1]),
              orderProducts(demoCarts[2]),
              Divider(color: Colors.grey.shade400),
              orderInfo('Subtotal', '\$200.3'),
              orderInfo('Delivery fee', '\$23.5'),
              orderInfo('Discounts', '-\$10.00'),
              Divider(color: Colors.grey.shade400),
              orderInfo('Total', '\$213.29'),
              Divider(color: Colors.grey.shade400),
              orderInfo('Delivery to', 'Home, 12 Van Cao Str.'),
              orderInfo('Status', 'Delivering'),
              const SizedBox(height: 24),
              OutlineButton(
                text: 'Need help?',
                press: () {},
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget orderProducts(Cart order) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 44,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(order.product.images[0]),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(order.product.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: kTextColorDarker,
                    )),
                const SizedBox(height: 4),
                Text('Qty: ${order.numOfItem}  •  Color: White',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500,
                    )),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$${order.product.price.toString()}',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: kTextColorDarker)),
            ],
          ),
        ],
      ),
    );
  }

  Widget orderInfo(String title, String content) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.zero,
      title: Text(title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          )),
      trailing: title == 'Status'
          ? Chip(
              visualDensity: const VisualDensity(
                horizontal: 0,
                vertical: -1,
              ),
              label: const Text(
                'Delivering',
                style: TextStyle(fontSize: 14),
              ),
              labelStyle:
                  const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
              backgroundColor: kPrimaryColor.withOpacity(0.1),
            )
          : Text(content,
              style: TextStyle(
                fontSize: title == 'Total' ? 18 : 16,
                fontWeight:
                    title == 'Total' ? FontWeight.bold : FontWeight.w500,
                color: kTextColorDarker,
              )),
    );
  }
}

// ListTile(
              //   visualDensity: VisualDensity(vertical: -4),
              //   contentPadding: EdgeInsets.zero,
              //   title: Text('Status', style: body16),
              //   trailing: Chip(
              //     visualDensity: VisualDensity(
              //       horizontal: 0,
              //       vertical: -1,
              //     ),
              //     label: Text(
              //       'Delivering',
              //       style: TextStyle(fontSize: 14),
              //     ),
              //     labelStyle: TextStyle(
              //         color: kPrimaryColor, fontWeight: FontWeight.bold),
              //     backgroundColor: kPrimaryColor.withOpacity(0.1),
              //   ),
              // ),


                // Container(
          //     padding: EdgeInsets.all(12),
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: Colors.white.withOpacity(0.15),
          //     ),
          //     child: Icon(
          //       Icons.textsms,
          //       //size: 28,
          //       color: Colors.white,
          //     )),
          // SizedBox(width: 8);