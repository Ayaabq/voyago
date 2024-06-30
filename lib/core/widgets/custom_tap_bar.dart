import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';


class CustomTapBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTapBar (
      {super.key, required this.tapController, required this.taps, required this.onTap, required this.inScroll});
  final TabController tapController;
  final List<String> taps;
  final bool inScroll;
  final void Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    var content =TabBar(
        onTap: onTap,
        isScrollable: true,
        indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
        controller: tapController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: CustomColors.kMove[1],
        ),
        labelColor: CustomColors.kWhite[0],
        unselectedLabelColor: CustomColors.kGrey[2],
        tabs: taps
            .map((e) => Padding(
          padding: const EdgeInsets.all(8),
          child: Tab(
            text: e,
          ),
        ))
            .toList());
    return  content;
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
