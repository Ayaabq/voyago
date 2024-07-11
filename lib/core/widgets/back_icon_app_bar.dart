import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/custom_colors.dart';

class BackIconAppBar extends StatelessWidget {
  const BackIconAppBar({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return IconButton(

      style:  ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),

      ),
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: CustomColors.kMove[4],
      ),
      onPressed: () {
        GoRouter.of(context).pop();
      },
    );
  }
}
