import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/screen_size_util.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: ScreenSizeUtil.screenHeight * .47,

          child: FittedBox(
            child: Image.asset(
              HomeAssets.skyBackground,
              fit: BoxFit.cover,
            ),
          ),
          // height: 100,
        ),
        Container(
          height: ScreenSizeUtil.screenHeight * .47,
          width: ScreenSizeUtil.screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  CustomColors.kMove[5],
                  const Color.fromARGB(196, 176, 139, 207),
                  // Color.fromARGB(232, 215, 193, 234),
                  const Color.fromARGB(254, 255, 255, 255),
                ],
                stops: const [
                  0.15,
                  0.4,
                  // 0.6,
                  0.8
                ]),
          ),
        )
      ],
    );
  }
}
