import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:elevate_ecommerce/shared/widgets/outline_button.dart';
import '../../../models/cart.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
    );
  }

  Widget orderProducts(Cart cart) {
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
                child: Image.asset(cart.product.images[0]),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cart.product.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: kTextColorDarker,
                    )),
                const SizedBox(height: 4),
                Text('Qty: ${cart.numOfItem}  •  Color: White',
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
              Text('\$${cart.product.price.toString()}',
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
              label: Text(
                orderStatuses[0].name,
                style: const TextStyle(fontSize: 13),
              ),
              labelStyle: TextStyle(
                  color: orderStatuses[0].color, fontWeight: FontWeight.w600),
              backgroundColor: orderStatuses[0].color.withOpacity(0.1),
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
