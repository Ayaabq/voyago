import 'package:flutter/material.dart';
import 'package:voyago/feature/get_started/presentation/views/widgets/any_on_boarding.dart';
import 'package:voyago/feature/get_started/presentation/views/widgets/first_on_boarding.dart';
import '../../../data/models/on_boarding_model.dart';

class OnBoardingColumn extends StatelessWidget {
  const OnBoardingColumn({super.key, required this.onBoardingModel});
  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    bool isFirst = onBoardingModel.decreptionText == null;
    return Padding(
      padding: const EdgeInsets.symmetric(
          // vertical: 91,
          horizontal: 17),
      child: isFirst
          ? FirstOnboarding(onBoardingModel: onBoardingModel)
          : AnyOnBoarding(onBoardingModel: onBoardingModel),
    );
  }
}
