import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';

import 'package:voyago/feature/home/presentation/views/widgets/app_bar/location_icon_button.dart';
import 'package:voyago/feature/home/presentation/views/widgets/app_bar/search_elevated_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SearchElevatedButton(onTap: () {
          GoRouter.of(context).push(AppRouter.kSearchView);
        }),
        LocationIconButton(onTap: () {})
      ],
    );
  }
}
