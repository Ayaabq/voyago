import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:go_router/go_router.dart';
=======
import 'package:flutter_bloc/flutter_bloc.dart';
>>>>>>> bb671e073b847e8225a30a4eea713f948cdc9ed8
import 'package:onboarding_animation/onboarding_animation.dart';
import 'package:voyago/core/utils/app_router.dart';

import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../maneger/on_boarding_cubit/on_boarding_cubit_cubit.dart';
import 'on_boardin_button.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator(
      {super.key, required this.pageController, required this.backgrounds});
  final PageController pageController;
  final List<Widget> backgrounds;

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final bool isNotLast = widget.pageController.page == null ||
        widget.pageController.page!.toInt() != 3;
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SmoothPageIndicator(
          controller: widget.pageController,
          count: widget.backgrounds.length,
          effect: ExpandingDotsEffect(
              activeDotColor: CustomColors.kWhite[0],
              dotColor: const Color(0xffA2A1A1),
              dotHeight: 8.0,
              dotWidth: 7.0,
              radius: 18.0),
        ),
        const SizedBox(
          height: 10,
        ),
        OnBoardingButton(
          title: !isNotLast ? "Register" : "Next",
          onTap: () {
            if (isNotLast) {
              widget.pageController.nextPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut);
              setState(() {});
            } else {
              GoRouter.of(context).push(AppRouter.kLoginView);
            }
          },
        ),
        SizedBox(height: ScreenSizeUtil.screenHeight * .08)
      ],
=======

    return BlocBuilder<OnBoardingCubitCubit, OnBoardingCubitState>(
      builder: (BuildContext context, state){
        final bool isNotLast = state is! OnBoardingLastState;
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SmoothPageIndicator(
              controller: pageController,
              count: backgrounds.length,
              effect: ExpandingDotsEffect(
                  activeDotColor: CustomColors.kWhite[0],
                  dotColor: const Color(0xffA2A1A1),
                  dotHeight: 8.0,
                  dotWidth: 7.0,
                  radius: 18.0),
            ),
            const SizedBox(
              height: 10,
            ),
            OnBoardingButton(
              title: !isNotLast ? "Register" : "Next",
              onTap: () {
                if (isNotLast) {
                  pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);

                } else {
                  // go to register
                }
              },
            ),
            SizedBox(height: ScreenSizeUtil.screenHeight * .08)
          ],
        );
      },
>>>>>>> bb671e073b847e8225a30a4eea713f948cdc9ed8
    );
  }
}
