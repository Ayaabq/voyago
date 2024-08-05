import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/utils/custom_colors.dart';

class AppBarIconButton extends StatefulWidget {
  const AppBarIconButton({super.key, required this.onTap, this.icon, this.color});
  final void Function() onTap;
  final  IconData? icon;
  final Color? color;

  @override
  State<AppBarIconButton> createState() => _AppBarIconButtonState();
}

class _AppBarIconButtonState extends State<AppBarIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(0),
      onPressed: widget.onTap,
      icon: Icon(
        widget.icon??Iconsax.location,
        size: 40,
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xff595959)
            : CustomColors.kWhite[0],
      ),
    );
  }
}
