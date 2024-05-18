import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/image_slider.dart';

class TripViewBody extends StatelessWidget {
  const TripViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Container(
            height: ScreenSizeUtil.dynamicHeight(467/812),
            width: double.infinity,
            child: Column(
              children: [
                ImageSlider()
              ],
            ),

          ),
        )
      ],
    );
  }
}
