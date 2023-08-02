import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  SearchField({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function? onTap;
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.9,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: GetBuilder<HomeController>(
        builder: (_) {
          return TextField(
            onTap: onTap as void Function()?,
            controller: controller.searchTextController,
            onChanged: (value) {
              controller.addSearchToList(value);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(9)),
              //border: InputBorder.none,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide(color: Colors.grey.shade300)),

              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide(color: Colors.grey.shade300)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide(color: Colors.grey.shade300)),
              hintText: "What are you looking for?",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(Icons.search, color: Colors.grey, size: 20),
              ),
              suffixIcon: controller.searchTextController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        controller.clearSearch();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: kPrimaryColor,
                      ),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
