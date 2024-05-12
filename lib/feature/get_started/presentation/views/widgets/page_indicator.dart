import 'package:flutter/material.dart';
import 'package:onboarding_animation/onboarding_animation.dart';

import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/screen_size_util.dart';
import 'on_boardin_button.dart';

class PageIndicator extends StatefulWidget {
  const PageIndicator(
      {super.key, required this.pageController, required this.backgrounds});
  final PageController pageController;
  final List<Widget> backgrounds;

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
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
              // go to register
            }
          },
        ),
        SizedBox(height: ScreenSizeUtil.screenHeight * .08)
      ],
    );
  }
}
