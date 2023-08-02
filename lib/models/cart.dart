import 'package:elevate_ecommerce/constants.dart';

import 'product.dart';
import 'package:flutter/material.dart';

class Cart {
  final Product product;
  final int numOfItem;

  Cart({required this.product, required this.numOfItem});
}

// Demo data for our cart



List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numOfItem: 2),
  Cart(product: demoProducts[1], numOfItem: 1),
  Cart(product: demoProducts[3], numOfItem: 1),
];

List<Cart> cart1 = [
  Cart(product: demoProducts[2], numOfItem: 7),
  Cart(product: demoProducts[0], numOfItem: 4),
];

List<Cart> cart2 = [
  Cart(product: demoProducts[3], numOfItem: 1),
];

List<Cart> cart3 = [
  Cart(product: demoProducts[1], numOfItem: 1),
  Cart(product: demoProducts[3], numOfItem: 1),
  Cart(product: demoProducts[2], numOfItem: 1),
];

List<Cart> cart4 = [
  Cart(product: demoProducts[2], numOfItem: 2),
  Cart(product: demoProducts[1], numOfItem: 5),
  Cart(product: demoProducts[0], numOfItem: 1),
];

List<Cart> cart5 = [
  Cart(product: demoProducts[0], numOfItem: 10),
];



List<Status> orderStatuses = [
  Status('Processing', kOrangeColor),
  Status('Delivering', kPrimaryColor),
  Status('Completed', kGreenColor),
  Status('Cancelled', kTextColor),
];


class Status {
  final String name;
  final Color color;

  Status(this.name, this.color);
}

class Order {
  final List<Cart> products;

  final Status status;

  Order({required this.products, required this.status});
}

List<Order> orders = [
  Order(products: demoCarts, status: orderStatuses[0]),
  Order(products: cart1, status: orderStatuses[1]),
  Order(products: cart2, status: orderStatuses[1]),
  Order(products: cart3, status: orderStatuses[2]),
  Order(products: cart4, status: orderStatuses[2]),
  Order(products: cart1, status: orderStatuses[3]),
  Order(products: cart3, status: orderStatuses[2]),
  Order(products: cart2, status: orderStatuses[2]),
  Order(products: cart4, status: orderStatuses[3]),
  Order(products: cart1, status: orderStatuses[2]),
  Order(products: cart5, status: orderStatuses[2]),
  Order(products: cart2, status: orderStatuses[2]),
];
