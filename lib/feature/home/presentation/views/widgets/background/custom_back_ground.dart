import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/screen_size_util.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: ScreenSizeUtil.screenHeight * .23,

          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(
                height: ScreenSizeUtil.screenHeight * .4,
                width: ScreenSizeUtil.screenWidth,
                HomeAssets.skyBackground,
                fit: BoxFit.cover),
          ),
          // height: 100,
        ),
        Container(
          height: ScreenSizeUtil.screenHeight * .4,
          width: ScreenSizeUtil.screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  CustomColors.kMove[5],
                  const Color.fromARGB(196, 176, 139, 207),
                  Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(228, 151, 139, 185)
                      : const Color.fromARGB(229, 196, 184, 233),
                  Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xff2e2e2e)
                      : const Color.fromARGB(250, 255, 255, 255),
                ],
                stops: const [
                  0.15,
                  0.4,
                  0.55,
                  .9
                ]),
          ),
        )
      ],
    );
  }
}
