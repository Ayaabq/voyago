import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_rate.dart';
import 'package:voyago/core/widgets/location_with_country.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/image_slider/image_slider.dart';

class TripViewBody extends StatelessWidget {
  const TripViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 4,
          child: SizedBox(
            height: ScreenSizeUtil.dynamicHeight(467/812),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageSlider(),
                Text("Berlin: 3-Hours City Tour by Boat ",
                style: Styles.textStyle20W700,
                  textAlign: TextAlign.start,
                ),
                LocationWithCountry(country: "Berlin, Germany"),
                CustomRating(rate: 4.8)
              ],
            ),

          ),
        )
      ],
    );
  }
}
