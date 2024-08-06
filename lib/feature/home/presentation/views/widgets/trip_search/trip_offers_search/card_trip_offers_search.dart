import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_rate.dart';
import 'package:voyago/feature/favorite/presentation/views/widgets/favorite_icon_button.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/trip_offers_search/colunm_offer_trip.dart';

import '../../../../../../../core/utils/screen_size_util.dart';

class TripOfferSearchCard extends StatelessWidget {
  const TripOfferSearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    bool isArabic = context.locale.languageCode == 'ar';
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 4,
      child: Container(
        // Use a fraction of the screen width and height instead of fixed values
        width: ScreenSizeUtil.screenWidth * 0.45,
        //  height: ScreenSizeUtil.screenHeight * 1,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
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
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Theme.of(context).brightness == Brightness.dark
                        ? const Color.fromARGB(0, 83, 82, 82)
                        : const Color.fromARGB(0, 255, 255, 255),
                    Theme.of(context).brightness == Brightness.dark
                        ? Theme.of(context).cardColor
                        : CustomColors.kWhite[0],
                  ],
                  stops: const [
                    0.0,
                    0.6,
                    0.65,
                  ],
                ),
              ),
            ),
            const Align(
                alignment: AlignmentDirectional.topEnd,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: FavoriteButton(),
                )),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CustomColors.kWhite[0].withOpacity(0.6)),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: CustomRating(rate: 4.7),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 165,
                  width: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: isArabic
                            ? const Radius.circular(0)
                            : const Radius.circular(16),
                        topRight: isArabic
                            ? const Radius.circular(16)
                            : const Radius.circular(0),
                        bottomLeft: isArabic
                            ? const Radius.circular(0)
                            : const Radius.circular(16),
                        bottomRight: isArabic
                            ? const Radius.circular(16)
                            : const Radius.circular(0),
                      ),
                      color: CustomColors.kMove[3]),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "-30%  ",
                      style: Styles.textStyle18W700.copyWith(
                          fontSize: 12, color: CustomColors.kWhite[0]),
                    ),
                  ),
                ),
              ],
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
