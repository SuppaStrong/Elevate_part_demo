// ignore: file_names

import 'package:elevate_ecommerce/models/cart.dart';
import 'package:flutter/material.dart';

import '../constants.dart';


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

// Demo data for our cart

List<Status> orderStatuses = [
  Status('Processing', kOrangeColor),
  Status('Delivering', kPrimaryColor),
  Status('Completed', kGreenColor),
  Status('Cancelled', kTextColor),
];

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
