import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/feature/get_started/presentation/views/widgets/get_started_body.dart';

import 'widgets/background_image.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
     body: GetStartedBody(),
     //  body: BackgroundImage(imageUrl: OnBoardingAssets.onBoaring2,),
    );
  }
}

