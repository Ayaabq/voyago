import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/feature/home/presentation/views/widgets/home_view_body.dart';

import '../../feature/home/presentation/views/home_view.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: CustomColors.kMove[0],
        color: CustomColors.kMove[1],
        animationDuration: const Duration(microseconds: 300),
        items: const [
          Icon(Iconsax.home),
          Icon(Iconsax.bag),
          Icon(Iconsax.heart),
          Icon(Iconsax.user),
        ],

      ) ,
    );
  }
}
