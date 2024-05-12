import 'package:flutter/material.dart';
import 'package:voyago/feature/get_started/presentation/views/widgets/background_image.dart';
import 'package:voyago/feature/get_started/presentation/views/widgets/on_boarding_column.dart';

import '../../../data/models/on_boarding_model.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(
      {super.key, required this.imageUrl, required this.onBoardingModel});
  final String imageUrl;
  final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(imageUrl: imageUrl),
        OnBoardingColumn(
          onBoardingModel: onBoardingModel,
        )
      ],
    );
  }
}
