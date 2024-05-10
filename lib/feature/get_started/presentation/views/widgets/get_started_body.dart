import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:voyago/core/utils/custom_colors.dart';

class GetStartedBody extends StatelessWidget {
  const GetStartedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        background: [],
        headerBackgroundColor: CustomColors.kWhite[0],
        pageBodies: [],
        totalPage: 5,
        speed: 1.8,
      ),
    );
  }
}
