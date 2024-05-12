import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';

import '../../../../../core/utils/styles.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({super.key, this.title = "Next", required this.onTap});
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:
      // 38
      17
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.kMove[4],
          foregroundColor: CustomColors.kWhite[0],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        child: SizedBox(
            height: 48,
            width: double.infinity,
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Styles.textStyle24W900.copyWith(
                  shadows: [
                    const Shadow(
                      color: Colors.white,
                      blurRadius: 2,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                ),
              ),
            )),

    );
  }
}
