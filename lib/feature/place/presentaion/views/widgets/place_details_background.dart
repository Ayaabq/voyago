import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/screen_size_util.dart';

class PlaceDetailsBackground extends StatelessWidget {
  const PlaceDetailsBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        FittedBox(
          fit: BoxFit.cover,
          child: Image.asset(
              height: ScreenSizeUtil.screenHeight * .35,
              width: ScreenSizeUtil.screenWidth,
              HomeAssets.dummyOffers,
              fit: BoxFit.cover),
        ),
        Container(
          height: ScreenSizeUtil.screenHeight * .36,
          width: ScreenSizeUtil.screenWidth,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(74, 255, 255, 255),

                  Color.fromARGB(0, 1, 1, 1),
                ],
              )),
        ),
      ],
    );
  }
}
