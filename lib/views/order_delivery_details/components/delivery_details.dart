import 'package:elevate_ecommerce/constants.dart';
import 'package:flutter/material.dart';



class DeliveryDetails extends StatelessWidget {
  const DeliveryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('YOUR ORDER IS ON THE WAY!',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      letterSpacing: 0.4,
                    )),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.schedule_outlined,
                      size: 26,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    const SizedBox(width: 8),
                    const Text('2 days',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        )),
                  ],
                ),
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.9),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(4, 10),
                    blurRadius: 10,
                    color: const Color.fromARGB(255, 0, 0, 101).withOpacity(0.2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.call,
                size: 28,
                color: kPrimaryColor,
              )),
        ],
      ),
    );
  }
}
