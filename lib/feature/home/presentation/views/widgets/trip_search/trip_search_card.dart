import 'package:flutter/material.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/core/widgets/favorite_icon_button.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/widgets/search_trip_image.dart';

class TripSearchCard extends StatelessWidget {
  const TripSearchCard({super.key, required this.fromPrice});
  final String fromPrice;
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Stack(
          children: [
            Card(
              elevation: 4,
              child: SearchTripImage(fromPrice: fromPrice),
            ),
            const Positioned(
              top: 11,
              right: 16,
              child: FavoriteButton(),
            ),

          ],
        ),
      ),
    );
  }
}

