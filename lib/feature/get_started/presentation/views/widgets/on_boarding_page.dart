import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/feature/get_started/presentation/views/widgets/background_image.dart';
import 'package:voyago/feature/get_started/presentation/views/widgets/on_boarding_column.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Stack(
      children: [
        BackgroundImage(imageUrl: OnBoardingAssets.onBoaring2),
        OnBoardingColumn()
      ],
    );
  }
}
