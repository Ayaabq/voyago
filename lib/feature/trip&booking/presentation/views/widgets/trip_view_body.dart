import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_rate.dart';
import 'package:voyago/core/widgets/location_with_country.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/image_slider/image_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/image_slider/image_slider.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/image_slider/text_column.dart';

class TripViewBody extends StatelessWidget {
  const TripViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       ImageCard()
      ],
    );
  }
}
