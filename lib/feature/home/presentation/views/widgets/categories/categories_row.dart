import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/screen_size_util.dart';
import 'category_item.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return
    //   Padding(
    //   padding: const EdgeInsets.symmetric(horizontal:  11),
    //   child: Row(
    //     children: [
    //       CategoryItem(
    //         title: "Trips",
    //         icon: Image.asset(HomeAssets.categoryTripsIcon),
    //       ),
    //       const SizedBox(width: 24,),
    //       CategoryItem(
    //         title: "Attractions",
    //         icon: Image.asset(HomeAssets.categoryAttractionIcon),
    //       ),
    //
    //     ],
    //   ),
    // );
      Padding(
        padding: EdgeInsets.all(ScreenSizeUtil.dynamicWidth(0.05)), // 5% of the screen width padding
        child: Row(
          children: [
            CategoryItem(
              title: "Trips",
              iconPath: HomeAssets.categoryTripsIcon,
            ),
            SizedBox(width: ScreenSizeUtil.dynamicWidth(0.06)), // 6% of the screen width spacing
            CategoryItem(
              title: "Attractions",
              iconPath: HomeAssets.categoryAttractionIcon,
            ),
          ],
        ),
      );
  }
}
