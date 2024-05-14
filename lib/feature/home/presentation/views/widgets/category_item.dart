import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.5),
      
        height: 64,
      
        decoration: BoxDecoration(
      
            color: CustomColors.kWhite[0],
          borderRadius: BorderRadius.circular(18)
        ),
        child: TextButton.icon(
          onPressed: () {
      
      
          },
          icon: Image.asset(HomeAssets.categoryTripsIcon),
          label: Text(
            'Trips',
            style: Styles.textStyle16W400.copyWith(
              color: CustomColors.kMove[9],
            )
          ),
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          ),
        ),
      ),
    );
  }
}
