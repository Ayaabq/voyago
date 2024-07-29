import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/screen_size_util.dart';
import 'category_item.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return Padding(
      padding: EdgeInsets.all(
          ScreenSizeUtil.dynamicWidth(0.005)), // 5% of the screen width padding
      child: Row(
        children: [
           CategoryItem(
            title: "Trips".tr(),
            iconPath: HomeAssets.categoryTripsIcon,
          ),
          SizedBox(
              width: ScreenSizeUtil.dynamicWidth(
                  0.06)), // 6% of the screen width spacing
           CategoryItem(
            title: "Attractions".tr(),
            iconPath: HomeAssets.categoryAttractionIcon,
          ),
        ],
      ),
    );
  }
}
