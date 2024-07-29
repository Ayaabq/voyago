import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voyago/feature/search/presentation/views/widgets/category_item_search.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/screen_size_util.dart';
import '../../../../home/presentation/views/widgets/categories/category_item.dart';

class CategoriesRowSearch extends StatelessWidget {
  const CategoriesRowSearch({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return Padding(
      padding: EdgeInsets.all(
          ScreenSizeUtil.dynamicWidth(0.005)), // 5% of the screen width padding
      child: Row(
        children: [
           CategoryItemSearch(
            title: "destination".tr(),
            iconPath: HomeAssets.locationIcons,
          ),
          SizedBox(
              width: ScreenSizeUtil.dynamicWidth(
                  0.02)), // 6% of the screen width spacing
           CategoryItemSearch(
            title: "attractions".tr(),
            iconPath: HomeAssets.categoryAttractionIcon,
          ),
          SizedBox(width: ScreenSizeUtil.dynamicWidth(0.02)),
           CategoryItemSearch(
            title: "tops".tr(),
            iconPath: HomeAssets.categoryTopsIcon,
          ),
        ],
      ),
    );
  }
}
