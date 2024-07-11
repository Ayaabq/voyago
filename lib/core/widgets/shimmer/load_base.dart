import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/custom_colors.dart';

class LoadBase extends StatelessWidget {
  const LoadBase({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      // baseColor: Theme.of(context).primaryColor.withOpacity(.20)!,
      // highlightColor: Theme.of(context).primaryColor.withOpacity(.10),

      baseColor: CustomColors.kGrey[0].withOpacity(.6),
      highlightColor:  CustomColors.kGrey[0],
      // enabled: _enabled,
      child: child??const SizedBox.shrink(),
    );
  }


}
