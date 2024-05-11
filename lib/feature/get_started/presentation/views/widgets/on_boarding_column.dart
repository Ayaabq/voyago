import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voyago/core/utils/assets.dart';

import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/on_boarding_model.dart';

class OnBoardingColumn extends StatelessWidget {
  const OnBoardingColumn({super.key, required this.onBoardingModel});
  final OnBoardingModel  onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 91,
      horizontal: 17),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 39),
            child: FittedBox(
              child: Image.asset(AssetsData.logoAllWhite,


              ),
            ),
          ),
         const  Spacer(),

           Text(
           onBoardingModel.descreptionTitle,
            textAlign: TextAlign.center,
            style: Styles.textStyle32W700.copyWith(
              color: CustomColors.kWhite[0],
              shadows: [
                const Shadow(
                  color: Colors.white,
                  blurRadius: 2,
                  offset: Offset(1, 1),
                ),
              ],
            ),
          ),
          Spacer(),
           if(onBoardingModel.decreptionText != null)
           Text(
             onBoardingModel.decreptionText!,
            style: Styles.textStyle18W400.copyWith(
              color: CustomColors.kWhite[0]
            ),
          ),
         Spacer(),

        ],
      ),
    );
  }
}
