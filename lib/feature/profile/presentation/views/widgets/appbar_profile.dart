import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/styles.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
    required this.titel,
  });

  final String titel;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColors.kWhite[0],
      title: Text(
        titel,
        style: Styles.textStyle20W700.copyWith(fontWeight: FontWeight.w600),
      ),
      shadowColor: Colors.grey,
      elevation: 4,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: CustomColors.kMove[4],
        ),
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
    );
  }
}
