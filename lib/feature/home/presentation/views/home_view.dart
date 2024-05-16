import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/feature/home/presentation/views/widgets/home_view_body.dart';

import '../../../../core/utils/custom_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: CustomColors.kMove[0],
        color: CustomColors.kMove[0],
        animationDuration: const Duration(microseconds: 300),
        items: const [
          Icon(Iconsax.home),
          Icon(Iconsax.bag_2),
          Icon(Iconsax.heart),
          Icon(Iconsax.profile_add),
        ],

      ) ,
      body: HomeViewBody(),
    );
  }
}
