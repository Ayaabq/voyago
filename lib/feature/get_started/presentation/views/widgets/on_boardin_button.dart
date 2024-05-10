import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({super.key,  this.title= "Next"});
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.kMove[4],
          foregroundColor: CustomColors.kWhite[0]),
      child:  Text(title),
    );
  }
}
