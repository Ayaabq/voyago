import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/custom_colors.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showTabs;
  final TabController tabController;
  final void Function(int index) onTap;

  const TransparentAppBar({super.key, required this.showTabs, required this.tabController, required this.onTap});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom:  showTabs
          ? TabBar(
          //isScrollable: true,

        controller: tabController,

        tabs: [
          Text("Details"), Text("Itinerary"),
          // Text("Notes"),
          // Text("Places"),
          Text("Reviews")
        ],
        onTap: onTap,
      )
          : null,
      backgroundColor: showTabs?CustomColors.kWhite[0]:Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Container(
          width: 35,
          height: 35,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: CustomColors.kMove[4],
          ),
        ),
        onPressed: () {
          // Handle the leading icon button press
        },
      ),
      actions: [
        IconButton(
          icon:  Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              Iconsax.share,
              color: CustomColors.kMove[4],
            ),
          ),
          onPressed: () {
            // Handle the share button press
          },
        ),
        IconButton(
          icon: Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              Iconsax.heart,
              color: CustomColors.kMove[4],
            ),
          ),
          onPressed: () {
            // Handle the favorite button press
          },
        ),
      ],
    );
  }
}
