import 'package:flutter/material.dart';

class TextCostDetail extends StatelessWidget {
  final int child;
  final double childPrice;
  final double adultPrice;
  final int  adult;

  const TextCostDetail({super.key, required this.child, required this.adult, required this.childPrice, required this.adultPrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '\$$childPrice x $child Child(s)',
          style: const TextStyle(

            fontSize: 16,
          ),
        ),
        Text(
          '\$$adultPrice x $adult Adult(s)',
          style: const TextStyle(

            fontSize: 16,
          ),
        ),

      ],
    );
  }
}
