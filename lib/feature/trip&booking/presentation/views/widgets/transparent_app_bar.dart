import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/custom_colors.dart';

import '../../../../../core/widgets/custom_tap_bar.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showTabs;
  final TabController tabController;
  final void Function(int index) onTap;
  final String title;
  const TransparentAppBar(
      {super.key,
      required this.showTabs,
      required this.tabController,
      required this.onTap,
      required this.title});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return
    //   AppBar(
    //   title: showTabs ? Text(title) : null,
    //   bottom: showTabs
    //       ?
    //   // TabBar(
    //   //         //isScrollable: true,
    //   //     // labelPadding: EdgeInsets.all(20),
    //   //       indicatorPadding: EdgeInsets.symmetric(vertical: 2),
    //   //         controller: tabController,
    //   //   indicator: BoxDecoration(
    //   //     color: CustomColors.kMove[3],
    //   //     borderRadius: BorderRadius.circular(30.0),
    //   //   ),
    //   //         tabs: [
    //   //           Container(
    //   //
    //   //               padding: EdgeInsets.symmetric(horizontal: 10),
    //   //               decoration: BoxDecoration(
    //   //                   borderRadius: BorderRadius.circular(30),
    //   //                   ),
    //   //               child: Container(child: Text("Details"))),
    //   //           Container(
    //   //               padding: EdgeInsets.symmetric(horizontal: 10),
    //   //               decoration: BoxDecoration(
    //   //                   borderRadius: BorderRadius.circular(30),
    //   //                   ),
    //   //               child: Text("Itinerary")),
    //   //           // Text("Notes"),
    //   //           // Text("Places"),
    //   //           Container(
    //   //               padding: EdgeInsets.symmetric(horizontal: 10),
    //   //               decoration: BoxDecoration(
    //   //                   borderRadius: BorderRadius.circular(30),
    //   //                   ),
    //   //               child: Text("Reviews"))
    //   //         ],
    //   //         onTap: onTap,
    //   //       )
    //   TabBar(
    //       onTap: onTap,
    //       isScrollable: true,
    //       indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
    //       controller: tabController,
    //       indicator: BoxDecoration(
    //         borderRadius: BorderRadius.circular(20),
    //         color: CustomColors.kMove[3],
    //       ),
    //       labelColor: CustomColors.kWhite[0],
    //       unselectedLabelColor: CustomColors.kGrey[2],
    //       tabs: [
    //         Container(
    //
    //             padding: EdgeInsets.symmetric(horizontal: 10),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(30),
    //             ),
    //             child: Container(child: Text("Details"))),
    //         Container(
    //             padding: EdgeInsets.symmetric(horizontal: 10),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(30),
    //             ),
    //             child: Text("Itinerary")),
    //         // Text("Notes"),
    //         // Text("Places"),
    //         Container(
    //             padding: EdgeInsets.symmetric(horizontal: 10),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(30),
    //             ),
    //             child: Text("Reviews"))
    //       ]
    //
    //   ): null,
    //   backgroundColor: showTabs ? CustomColors.kWhite[0] : Colors.transparent,
    //   elevation: 0,
    //   leading: IconButton(
    //     icon: Container(
    //       width: 35,
    //       height: 35,
    //       decoration: const BoxDecoration(
    //         shape: BoxShape.circle,
    //         color: Colors.white,
    //       ),
    //       child: Icon(
    //         Icons.arrow_back_ios_new,
    //         color: CustomColors.kMove[4],
    //       ),
    //     ),
    //     onPressed: () {
    //       // Handle the leading icon button press
    //     },
    //   ),
    //   actions: [
    //     IconButton(
    //       icon: Container(
    //         width: 35,
    //         height: 35,
    //         decoration: const BoxDecoration(
    //           shape: BoxShape.circle,
    //           color: Colors.white,
    //         ),
    //         child: Icon(
    //           Iconsax.share,
    //           color: CustomColors.kMove[4],
    //         ),
    //       ),
    //       onPressed: () {
    //         // Handle the share button press
    //       },
    //     ),
    //     IconButton(
    //       icon: Container(
    //         width: 35,
    //         height: 35,
    //         decoration: const BoxDecoration(
    //           shape: BoxShape.circle,
    //           color: Colors.white,
    //         ),
    //         child: Icon(
    //           Iconsax.heart,
    //           color: CustomColors.kMove[4],
    //         ),
    //       ),
    //       onPressed: () {
    //         // Handle the favorite button press
    //       },
    //     ),
    //   ],
    // )
      AppBar(
        title: const Text('Product Screen'),
        bottom: CustomTapBar(
          tapController: tabController,
          onTap: (index) {},
          inScroll: false,
          taps: const [
            'Details',
            'Itenrary',
            'Reviews',
          ],
        ),
      )
    ;
  }
}
