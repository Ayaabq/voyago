import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets.dart';
import 'category_item.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:  11),
      child: Row(
        children: [
          CategoryItem(
            title: "Trips",
            icon: Image.asset(HomeAssets.categoryTripsIcon),
          ),
          const SizedBox(width: 24,),
          CategoryItem(
            title: "Attractions",
            icon: Image.asset(HomeAssets.categoryAttractionIcon),
          ),

        ],
      ),
    );
  }
}
