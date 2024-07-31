// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:voyago/destination/utils/custom_colors.dart';
// import 'package:voyago/feature/profile/presentation/views/profile_view.dart';

// import '../../feature/home/presentation/views/home_view.dart';

// class BottomBar extends StatefulWidget {
//    BottomBar({super.key, this.screenIndex=0});
//      int screenIndex;

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
// final List<Widget> tapViews= [ HomeView(),
// Container(),
// Container(),
// ProfileView()

// ];

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(

//       extendBody: true, // Ensure the body extends behind the navigation bar
//       bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: Colors.transparent,
//         buttonBackgroundColor: CustomColors.kMove[4],
//         color: CustomColors.kMove[1],
//         animationDuration: const Duration(microseconds: 300),
//         items:  [
//           Icon(Iconsax.home,
//           color:  CustomColors.kMove[5],),
//           Icon(Iconsax.bag,
//             color: CustomColors.kMove[5],),
//           Icon(Iconsax.heart,
//             color: CustomColors.kMove[5],),
//           Icon(Iconsax.user,
//             color: CustomColors.kMove[5],),
//         ],
//         onTap: (index){
//           setState(() {
//             widget.screenIndex=index;
//           });
//         },

//       ) ,
//       body: tapViews[widget.screenIndex],
//     );
//   }
// }

///
library;

import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/feature/books/presentation/views/books_view.dart';

import 'package:iconsax/iconsax.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../feature/home/presentation/views/home_view.dart';
import '../../feature/profile/presentation/views/profile_view.dart';
import '../../feature/favorite/presentation/views/favorites_view.dart';

//new

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    const BooksView(),
    const FavoritesView(),
    const ProfileView(),
  ];

  final List<Map<String, dynamic>> _navigationItems = [
    {
      'icon': Iconsax.home,
      'outlineIcon': Iconsax.home5,
      'label': 'Home',
    },
    {
      'icon': Iconsax.shopping_bag,
      'outlineIcon': Iconsax.shopping_bag5,
      'label': 'Books',
    },
    {
      'icon': Iconsax.heart,
      'outlineIcon': Iconsax.heart5,
      'label': 'Favorite',
    },
    {
      'icon': Iconsax.user,
      'outlineIcon': Icons.account_circle,
      'label': 'Profile',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        items: _navigationItems.map((item) {
          final int index = _navigationItems.indexOf(item);
          final bool isActive = _currentIndex == index;
          return NavigationItem(
            icon: isActive ? item['outlineIcon'] : item['icon'],
            label: isActive ? null : item['label'],
            isActive: isActive,
          );
        }).toList(),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.transparent,
        color: Theme.of(context).brightness == Brightness.dark
            ? CustomColors.kMove[2]
            : CustomColors.kMove[0],
        buttonBackgroundColor: Theme.of(context).brightness == Brightness.dark
            ? CustomColors.kMove[2]
            : CustomColors.kMove[0],
        animationDuration: const Duration(milliseconds: 600),
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final IconData icon;
  final String? label;
  final bool isActive;

  const NavigationItem({
    super.key,
    required this.icon,
    this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 24,
          color: isActive ? CustomColors.kMove[5] : CustomColors.kMove[5],
        ),
        if (label != null) ...[
          const SizedBox(height: 4),
          Text(
            label!,
            style: TextStyle(
              color: isActive ? CustomColors.kMove[5] : CustomColors.kMove[5],
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }
}
