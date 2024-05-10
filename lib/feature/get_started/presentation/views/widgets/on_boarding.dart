import 'package:flutter/material.dart';
import 'package:onboarding_animation/onboarding_animation.dart';
import 'package:voyago/feature/get_started/presentation/views/widgets/on_boarding_page.dart';

import '../../../../../core/utils/assets.dart';
import 'background_image.dart';
class OnBoarding extends StatelessWidget {
   OnBoarding({super.key});

 final  PageController pc =  PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
     children: [
       PageView(

        controller: pc,
        children: backgrounds,
      ),
       Container(
         alignment: const  Alignment(0,0.5),
         child: SmoothPageIndicator(
             controller: pc, count: backgrounds.length,
         ),
       ),

     ]
    );
  }
}
 const List<Widget> backgrounds = [
   OnBoardingPage(),
   OnBoardingPage(),
  BackgroundImage(imageUrl: OnBoardingAssets.onBoaring1),


   BackgroundImage(imageUrl: OnBoardingAssets.onBoaring2),
  BackgroundImage(imageUrl: OnBoardingAssets.onBoaring3),
   OnBoardingPage(),
  BackgroundImage(imageUrl: OnBoardingAssets.onBoaring4),
  BackgroundImage(imageUrl: OnBoardingAssets.onBoaring5),
];
