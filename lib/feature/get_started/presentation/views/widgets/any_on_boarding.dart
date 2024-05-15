import 'package:flutter/material.dart';
import 'package:voyago/feature/get_started/data/models/on_boarding_model.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../../../../core/utils/styles.dart';

class AnyOnBoarding extends StatelessWidget {
  const AnyOnBoarding({super.key, required this.onBoardingModel});
  final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 27,
              horizontal:  19
          ),
          child: Image.asset(AssetsData.miniLogo,
            width:70 ,),
        ),

        const  Spacer(flex: 3,),

        Text(
          onBoardingModel.descreptionTitle,
          textAlign:  TextAlign.start,
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
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),

        Text(
          onBoardingModel.decreptionText!,
          style: Styles.textStyle18W400.copyWith(
              color: CustomColors.kWhite[0]
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: ScreenSizeUtil.screenHeight * .18)

      ],
    );
  }
}
