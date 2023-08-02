import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/models/cart.dart';
import 'package:flutter/material.dart';



class OrdersList extends StatelessWidget {
  const OrdersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: ListView.separated(
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          separatorBuilder: (context, index) =>
              Divider(color: Colors.grey.shade300),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return orderTile(order, context);
          }),
    );
  }

  Widget orderTile(Order order, context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Order #10294756',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: kTextColorDarker,
                      )),
                  const SizedBox(height: 4),
                  Text('5 items',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500,
                      )),
                  const SizedBox(height: 2),
                  Text('12-10-2022',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500,
                      )),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('\$100.26',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: kTextColorDarker,
                    )),

                //SizedBox(height: 0),
                // Text(
                //   status,
                //   style: TextStyle(
                //     color: color,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                Chip(
                  label: Text(
                    order.status.name,
                    style: const TextStyle(fontSize: 13),
                  ),
                  labelStyle: TextStyle(
                      color: order.status.color, fontWeight: FontWeight.w600),
                  backgroundColor: order.status.color.withOpacity(0.05),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
