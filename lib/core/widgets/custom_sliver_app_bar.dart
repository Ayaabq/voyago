import 'package:flutter/material.dart';

import '../utils/screen_size_util.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar(
      {super.key, required this.child, this.color, this.title, this.actions});
  final Widget child;
  final Color? color;
  final Widget? title;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return SliverAppBar(
      title: title,
      actions: actions,
      expandedHeight: ScreenSizeUtil.dynamicHeight(.3),
      pinned: true,
      floating: true,
      flexibleSpace: child,
    );
  }
}
