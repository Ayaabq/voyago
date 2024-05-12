import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/on_boarding_model.dart';

class FirstOnboarding extends StatelessWidget {
  const FirstOnboarding({super.key, required this.onBoardingModel});
  final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: 39,
              vertical: ScreenSizeUtil.screenHeight * .14,),
          child: FittedBox(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                // minWidth: , minHeight: 1,
                maxHeight: 330, maxWidth: 280,
              ),
              child: Image.asset(
                AssetsData.logoAllWhite,
                 width: ScreenSizeUtil.screenWidth *.6,
                height: ScreenSizeUtil.screenHeight *.4,
              ),
            ),
          ),
        ),


        SizedBox(
          height: ScreenSizeUtil.screenHeight * .12,
          child: LayoutBuilder(

            builder: (context, constraints) {
              // Calculate font size based on width constraint
              double fontSizeWidth = constraints.maxWidth / 10; // Adjust the divisor as needed

              // Calculate font size based on height constraint
              double fontSizeHeight = constraints.maxHeight /2.5 ; // Adjust the divisor as needed

              // Choose the smaller font size to ensure that the text fits within both width and height constraints
              double fontSize = min(fontSizeWidth < fontSizeHeight ? fontSizeWidth : fontSizeHeight, 32);
              fontSize = fontSize<32 ? 20: 32;

              return Text(
                onBoardingModel.descreptionTitle,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle32W700.copyWith(
                  color: CustomColors.kWhite[0],
                  shadows: [
                    const Shadow(
                      color: Colors.white,
                      blurRadius: 2,
                      offset: Offset(1, 1),
                    ),
                  ],
                  // Set the font size
                  fontSize: fontSize,
                ),
              );
            },
          ),
        ),






        SizedBox(
          height: ScreenSizeUtil.screenHeight * .2,
          width: double.infinity,
        )

      ],
    );
  }
}
