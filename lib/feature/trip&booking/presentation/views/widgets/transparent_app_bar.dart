// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:voyago/core/utils/custom_colors.dart';
//
// import '../../../../../core/widgets/custom_tap_bar.dart';
//
// class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final bool showTabs;
//   final TabController tabController;
//   final void Function(int index) onTap;
//   final String title;
//   const TransparentAppBar(
//       {super.key,
//       required this.showTabs,
//       required this.tabController,
//       required this.onTap,
//       required this.title});
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       AppBar(
//       title: showTabs ? Text(title) : null,
//       bottom: showTabs
//           ?
//       CustomTapBar(tapController: tabController, taps:
//       const [
//         'Details',
//         'Itenrary',
//         'Reviews',
//       ], onTap: onTap,
//           inScroll: false): null,
//       backgroundColor: showTabs ? CustomColors.kWhite[0] : Colors.transparent,
//       elevation: 0,
//       leading: IconButton(
//         icon: Icon(
//           Icons.arrow_back_ios_new,
//           color: CustomColors.kMove[4],
//         ),
//         onPressed: () {
//           // Handle the leading icon button press
//         },
//       ),
//       actions: [
//         IconButton(
//           icon: Icon(
//             Iconsax.share,
//             color: CustomColors.kMove[4],
//           ),
//           onPressed: () {
//             // Handle the share button press
//           },
//         ),
//         IconButton(
//           icon: Icon(
//             Iconsax.heart,
//             color: CustomColors.kMove[4],
//           ),
//           onPressed: () {
//             // Handle the favorite button press
//           },
//         ),
//       ],
//     )
//     //   AppBar(
//     //     title: const Text('Product Screen'),
//     //     bottom: CustomTapBar(
//     //       tapController: tabController,
//     //       onTap: (index) {},
//     //       inScroll: false,
//     //       taps: const [
//     //         'Details',
//     //         'Itenrary',
//     //         'Reviews',
//     //       ],
//     //     ),
//     //   )
//     ;
//   }
// }
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/custom_colors.dart';

import '../../../../../core/widgets/back_icon_app_bar.dart';
import '../../../../../core/widgets/custom_tap_bar.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showTabs;
  final TabController tabController;
  final void Function(int index) onTap;
  final String title;

  const TransparentAppBar({
    super.key,
    required this.showTabs,
    required this.tabController,
    required this.onTap,
    required this.title,
  });

  @override
  Size get preferredSize {
    final tabBarHeight = showTabs ? kTextTabBarHeight : 0.0;
    return Size.fromHeight(kToolbarHeight + tabBarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: showTabs ? Text(title) : null,
      bottom: showTabs
          ? CustomTapBar(
        tapController: tabController,
        taps: const [
          'Overview',
          'Description',
          "What's Included",
          'Meeting Point',
          'Itinerary',
          'Some notes',
          'Places',
          'Reviews',
        ],
        onTap: onTap,
        inScroll: true,
      )
          : null,
      backgroundColor: showTabs ? CustomColors.kWhite[0] : Colors.transparent,
      elevation: 0,
      leading: BackIconAppBar(color:CustomColors.kWhite[3]),
      actions: [
        IconButton(
          icon: Icon(
            Iconsax.share,
            color: CustomColors.kMove[4],
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(CustomColors.kWhite[3]),
          ),
          onPressed: () {
            // Handle the share button press
          },
        ),
        IconButton(
          icon: Icon(
            Iconsax.heart,
            color: CustomColors.kMove[4],
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(CustomColors.kWhite[3]),
          ),
          onPressed: () {
            // Handle the favorite button press
          },
        ),
      ],
    );
  }
}
