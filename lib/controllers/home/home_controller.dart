import 'package:elevate_ecommerce/models/products/product_model.dart';
import 'package:elevate_ecommerce/provider/product_provider.dart';
import 'package:elevate_ecommerce/repositories/product_repositories.dart';
import 'package:elevate_ecommerce/views/my_order/order_list.dart';
import 'package:elevate_ecommerce/views/favorites/favorites_screen.dart';
import 'package:elevate_ecommerce/views/home/home_screen.dart';
import 'package:elevate_ecommerce/views/profile/profile_screen.dart';
import 'package:elevate_ecommerce/views/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ProductRepository repository;
  HomeController(this.repository);

  late final ProductProvider _productProvider = Get.find();
  late PageController pageController;

  TextEditingController searchTextController = TextEditingController();

  var productData = <ProductModel>[].obs;
  var searchList = <ProductModel>[].obs;
  List<Widget> pages = [
    HomeScreen(),
    WalletScreen(),
    const FavoriteScreen(),
    MyOrderScreen(),
    ProfileScreen(),
  ];
  var currentPage = 0.obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    getProductData();
    super.onInit();
  }

  void gotoPage(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  void getProductData() {
    _productProvider.getProductData().then((product) {
      productData(product);
      // ignore: avoid_print
      print(productData);
    });
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productData.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      var searchCatagory = search.category.toString();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName) ||
          searchCatagory.toString().contains(searchName);
    }).toList();

    update();
  }

  void catagorySearch(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productData.where((search) {
      var searchCatagory = search.category.toString().toLowerCase();

      return searchCatagory.toString().contains(searchName);
    }).toList();

    update();
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }
}
