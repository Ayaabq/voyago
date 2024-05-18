import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/custom_colors.dart';

import '../../feature/home/presentation/views/home_view.dart';

class BottomBar extends StatefulWidget {
   BottomBar({super.key, this.screenIndex=0});
     int screenIndex;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
final List<Widget> tapViews=const [ HomeView()];

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
        onTap: (index){
          setState(() {
            widget.screenIndex=index;
          });
        },


      ) ,
      body: tapViews[widget.screenIndex],
    );
  }
}
