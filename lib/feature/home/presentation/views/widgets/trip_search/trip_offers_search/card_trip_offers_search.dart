import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_rate.dart';
import 'package:voyago/feature/favorite/presentation/views/favorite_icon_button.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/trip_offers_search/colunm_offer_trip.dart';

import '../../../../../../../core/utils/screen_size_util.dart';

class TripOfferSearchCard extends StatelessWidget {
  const TripOfferSearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);

    return Card(
      elevation: 4,
      child: Container(
        // Use a fraction of the screen width and height instead of fixed values
        width: ScreenSizeUtil.screenWidth * 0.45,
        //  height: ScreenSizeUtil.screenHeight * 1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 8,
              right: 8,
              left: 8,
              bottom: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  HomeAssets.dummyOffers,
                  // Use a fraction of the container width and height instead of fixed values
                  width: ScreenSizeUtil.screenWidth * 0.4 * 0.8,
                  height: ScreenSizeUtil.screenHeight * 0.3 * 0.7,
                  fit: BoxFit
                      .cover, // This ensures the image covers the entire area
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color.fromARGB(0, 255, 255, 255),
                    Colors.white,
                  ],
                  stops: [
                    0.0,
                    0.6,
                    0.65,
                  ],
                ),
              ),
            ),
            const Positioned(
              top: 16,
              right: 16,
              child: FavoriteButton(),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CustomColors.kWhite[0].withOpacity(0.6)),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: CustomRating(rate: 4.7),
                ),
              ),
            ),
            Positioned(
              bottom: 45,
              right: -8,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16)),
                    color: CustomColors.kMove[3]),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "-30%  ",
                    style: Styles.textStyle18W700
                        .copyWith(fontSize: 12, color: CustomColors.kWhite[0]),
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: 10,
              // right: 15,
              left: 10,
              right: 10,
              child: TripOfferColumn(),
            ),
          ],
        ),
      ),
    );
  }
}
