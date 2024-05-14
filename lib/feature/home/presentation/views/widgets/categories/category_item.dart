import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.icon, required this.title});
  final Widget icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(

        height: 64,
      
        decoration: BoxDecoration(
      
            color: CustomColors.kWhite[0],
          borderRadius: BorderRadius.circular(18)
        ),
        child: TextButton.icon(
          onPressed: () {
      
      
          },
          icon: icon,
          label: Text(
            title,
            style: Styles.textStyle16W400.copyWith(
              color: CustomColors.kMove[9],
            )
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
                horizontal: 11.0,
                vertical: 8.0
            ),
          ),
        ),
      ),
    );
  }
}
