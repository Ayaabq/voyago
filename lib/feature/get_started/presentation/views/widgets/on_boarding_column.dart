import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/feature/get_started/presentation/views/widgets/first_on_boarding.dart';

import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/on_boarding_model.dart';

class OnBoardingColumn extends StatelessWidget {
  const OnBoardingColumn({super.key, required this.onBoardingModel});
  final OnBoardingModel  onBoardingModel;

  @override
  Widget build(BuildContext context) {
    bool isFirst = onBoardingModel.decreptionText ==null;
    return Padding(
      padding: const EdgeInsets.symmetric(
          // vertical: 91,
      horizontal: 17),
      child: isFirst?FirstOnboarding(onBoardingModel: onBoardingModel):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 23,
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
      ),
    );
  }
}
