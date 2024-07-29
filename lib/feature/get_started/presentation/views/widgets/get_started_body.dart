import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/get_started/data/models/on_boarding_model.dart';
import 'package:voyago/feature/get_started/presentation/views/widgets/on_boarding_page.dart';
import 'package:voyago/feature/get_started/presentation/views/widgets/page_indicator.dart';

import '../../../../../core/utils/assets.dart';
import '../../maneger/on_boarding_cubit/on_boarding_cubit_cubit.dart';

class GetStartedBody extends StatelessWidget {
  const GetStartedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubitCubit, OnBoardingCubitState>(
      builder: (BuildContext context, state) {
        return Stack(children: [
          PageView(
            onPageChanged: (index) {
              BlocProvider.of<OnBoardingCubitCubit>(context).setPage(index);
            },
            controller:
                BlocProvider.of<OnBoardingCubitCubit>(context).pageController,
            children: backgrounds,
          ),
          PageIndicator(
            pageController:
                BlocProvider.of<OnBoardingCubitCubit>(context).pageController,
            backgrounds: backgrounds,
          )
        ]);
      },
    );
  }
}

List<Widget> backgrounds = [
  OnBoardingPage(
    imageUrl: OnBoardingAssets.onBoarding1,
    onBoardingModel: OnBoardingModel(
      descreptionTitle: "get_started1".tr(),
    ),
  ),
  OnBoardingPage(
    imageUrl: OnBoardingAssets.onBoarding2,
    onBoardingModel: OnBoardingModel(
        descreptionTitle:  "get_started2".tr(),
        decreptionText:
        "get_started2 details".tr()),
  ),
  OnBoardingPage(
    imageUrl: OnBoardingAssets.onBoarding3,
    onBoardingModel: OnBoardingModel(
        descreptionTitle: "get_started3".tr(),
        decreptionText:
        "get_started3 details".tr()),
  ),
  OnBoardingPage(
    imageUrl: OnBoardingAssets.onBoarding4,
    onBoardingModel: OnBoardingModel(
        descreptionTitle: "get_started4".tr(),
        decreptionText:  "get_started4 details".tr() ),
  ),
  OnBoardingPage(
    imageUrl: OnBoardingAssets.onBoarding5,
    onBoardingModel: OnBoardingModel(
        descreptionTitle: "get_started5".tr(),
        decreptionText: "get_started5 details".tr()),
  )
];
