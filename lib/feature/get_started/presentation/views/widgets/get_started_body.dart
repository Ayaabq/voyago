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
      descreptionTitle: "Discover the best of the world with us",
    ),
  ),
  OnBoardingPage(
    imageUrl: OnBoardingAssets.onBoarding2,
    onBoardingModel: OnBoardingModel(
        descreptionTitle: "Find the best places to go",
        decreptionText:
            'Search in all the popular destinations to find the best place for you'),
  ),
  OnBoardingPage(
    imageUrl: OnBoardingAssets.onBoarding3,
    onBoardingModel: OnBoardingModel(
        descreptionTitle: 'Enjoy the magic of the nature',
        decreptionText:
            "See fantastic natural places around the world with just a few clicks"),
  ),
  OnBoardingPage(
    imageUrl: OnBoardingAssets.onBoarding4,
    onBoardingModel: OnBoardingModel(
        descreptionTitle: 'Explore the world like a real traveller',
        decreptionText: 'Find thousands of destinations for you to visit'),
  ),
  OnBoardingPage(
    imageUrl: OnBoardingAssets.onBoarding5,
    onBoardingModel: OnBoardingModel(
        descreptionTitle: 'Get the best offers and deals',
        decreptionText: 'Find the best deals to save your money'),
  )
];
