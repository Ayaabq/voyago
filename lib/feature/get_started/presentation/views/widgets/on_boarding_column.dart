import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/feature/get_started/presentation/views/widgets/on_boardin_button.dart';

class OnBoardingColumn extends StatelessWidget {
  const OnBoardingColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AssetsData.logoAllWhite),
        const Text(
          "Discover the best of the world with us",
          style: TextStyle(fontSize: 32),
        ),
        const Text(
          "Discover the best of the world with us",
          style: TextStyle(fontSize: 17),
        ),
       const  OnBoardingButton()
      ],
    );
  }
}
