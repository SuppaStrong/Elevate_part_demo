import 'package:elevate_ecommerce/models/order.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class FilterChips {
  String label;
  //Color color;
  bool isSelected;
  FilterChips(this.label, this.isSelected);
}

class _FilterState extends State<Filter> {
  int? _value = 0;
  bool selected = false;
  List<FilterChips> filterChips = [
    FilterChips('All', true),
    FilterChips(orderStatuses[0].name, false),
    FilterChips(orderStatuses[1].name, false),
    FilterChips(orderStatuses[2].name, false),
    FilterChips(orderStatuses[3].name, false),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, bottom: 4),
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            blurRadius: 10,
            color: const Color.fromARGB(255, 31, 31, 97).withOpacity(0.05),
          ),
        ],
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final filterChip = filterChips[index];
          return filterItem(filterChip, index);
        },
        itemCount: filterChips.length,
      ),
    );
  }

  Widget filterItem(FilterChips filterChip, index) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: ChoiceChip(
        label: Text(
          filterChip.label,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        labelStyle:
            TextStyle(color: _value == index ? Colors.white : kTextColor),
        backgroundColor: Colors.white,
        selected: _value == index,
        selectedColor: kPrimaryColor,
        pressElevation: 0,
        onSelected: (bool selected) {
          setState(() {
            _value = selected ? index : null;
          });
        },
      ),
    );
  }
}
