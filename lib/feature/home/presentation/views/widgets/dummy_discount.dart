
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:voyago/core/utils/assets.dart';

class DummyDiscount extends StatelessWidget {
  const DummyDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,

        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 17.0,),
            child: Image.asset(HomeAssets.dummyDiscount,
            height: 110,
            ),
          );
        }
      ),
    );
  }
}
