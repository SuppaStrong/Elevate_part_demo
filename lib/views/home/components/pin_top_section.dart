import 'package:elevate_ecommerce/constants.dart';
import 'package:elevate_ecommerce/views/home/components/search_field.dart';
import 'package:elevate_ecommerce/views/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class PinTopSection extends StatelessWidget {
  const PinTopSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 82,
        maxHeight: 82,
        child: Container(
          color: kPrimaryLightColor,
          child: Column(
            children: [
              SizedBox(height: 16),
              SearchField(onTap: () => Get.to(() => SearchScreen())),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

//test class
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
