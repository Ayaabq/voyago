import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/widgets/favorite_icon_button.dart';

import 'package:voyago/feature/home/presentation/views/widgets/offers/offers_details_column.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/screen_size_util.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return Card(
      elevation: 4,
      child: Container(

        width: ScreenSizeUtil.screenWidth * 0.35,
        height: ScreenSizeUtil.screenHeight  * 0.45,
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
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    HomeAssets.dummyOffers,
                    fit: BoxFit.cover, // This ensures the image covers the entire area
                  ),
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
              top: 11,
              right: 16,
              child: FavoriteButton(),
            ),
            const Positioned(
              top: 110,
              // right: 15,
              left: 10,
              child: OffersDetailsColumn(),
            ),
          ],
        ),
      ),
    );
  }
}
