import 'product.dart';

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
