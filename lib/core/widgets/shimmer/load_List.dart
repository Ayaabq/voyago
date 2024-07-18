import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';

import '../../utils/screen_size_util.dart';
import 'load_base.dart';

class LoadList extends StatelessWidget {
  const LoadList({super.key, this.itemCount = 3, this.isVertical = true});
  final int? itemCount;
  final bool isVertical;
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
      children: [
        for (int i = 0; i < (itemCount ?? 0); i++) content(context),
      ],
    );
  }

  content(BuildContext context) {
    return LoadBase(
      child: Container(
        padding: const EdgeInsets.all(12),
        height: ScreenSizeUtil.dynamicWidth(.3),
        width: !isVertical ? ScreenSizeUtil.dynamicWidth(.3) : double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: CustomColors.kWhite[0],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: CustomColors.kBlack[0].withOpacity(.1),
              blurRadius: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
