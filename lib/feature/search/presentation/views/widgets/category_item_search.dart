import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';

import '../../../../../../core/utils/screen_size_util.dart';

// class CategoryItem extends StatelessWidget {
//   const CategoryItem({super.key, required this.icon, required this.title});
//   final Widget icon;
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//
//         height: 64,
//
//         decoration: BoxDecoration(
//
//             color: CustomColors.kWhite[0],
//           borderRadius: BorderRadius.circular(18)
//         ),
//         child: TextButton.icon(
//           onPressed: () {
//
//
//           },
//           icon: icon,
//           label: Text(
//             title,
//             style: Styles.textStyle16W400.copyWith(
//               color: CustomColors.kMove[9],
//             )
//           ),
//           style: TextButton.styleFrom(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: 11.0,
//                 vertical: 8.0
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CategoryItemSearch extends StatelessWidget {
  final String title;
  final String iconPath;

  const CategoryItemSearch({
    super.key,
    required this.title,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return Expanded(
      child: Container(
        height: ScreenSizeUtil.dynamicHeight(0.05), // 8% of the screen height
        decoration: BoxDecoration(
          color: CustomColors.kWhite[0],
          borderRadius: BorderRadius.circular(
              ScreenSizeUtil.dynamicWidth(0.045)), // 4.5% of the screen width
        ),
        child: TextButton.icon(
          onPressed: () {},
          icon: Image.asset(
            iconPath,
            //   width: ScreenSizeUtil.dynamicWidth(0.1), // 8% of the screen width
            height:
                ScreenSizeUtil.dynamicHeight(0.5), // 8% of the screen height
          ),
          label: Text(
            title,
            style: Styles.textStyle12W400.copyWith(
              color: CustomColors.kMove[9],
            ),
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal:
                  ScreenSizeUtil.dynamicWidth(0.01), // 3% of the screen width
              vertical:
                  ScreenSizeUtil.dynamicHeight(0.01), // 1% of the screen height
            ),
          ),
        ),
      ),
    );
  }
}
