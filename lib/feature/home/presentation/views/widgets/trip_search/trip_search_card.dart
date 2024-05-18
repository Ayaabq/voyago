import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_rate.dart';
import 'package:voyago/core/widgets/favorite_icon_button.dart';
import 'package:voyago/core/widgets/location_with_country.dart';
import 'package:voyago/core/widgets/icons_text.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/time_trip.dart';

class TripSearchCard extends StatelessWidget {
  const TripSearchCard({super.key, required this.fromPrice});
  final String fromPrice;
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/images/dummy_offer.png'),
                fit: BoxFit.cover,
              ),
            ),
            width: 340,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      const Color(0xff5E4DA7).withOpacity(0.5),
                      const Color(0xffFEFEFF).withOpacity(0.0),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 8, top: 18, bottom: 11),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Rome Trip",
                          style: Styles.textStyle16W700,
                        ),
                        //  const LocationWithCountry(country: "Italy"),
                        IconsText(
                          text: "Italy",
                          icon: Icons.location_on,
                          colorIcon: CustomColors.kWhite[0],
                          sizeIcon: 10,
                          style: Styles.textStyle14W600
                              .copyWith(color: CustomColors.kWhite[0]),
                        ),
                        const CustomRating(rate: 4.8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: Text('5 / 20 reserved',
                                  style: Styles.textStyle10W400.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: CustomColors.kGrey[3])),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xffA498DA),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: Text('Available',
                                  style: Styles.textStyle10W400.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: CustomColors.kGrey[3])),
                            ),
                          ],
                        ),
                    //    const TimeTrip(day: "1"),

                        IconsText(
                            text: "day",
                            icon: Iconsax.timer,
                            colorIcon: CustomColors.kWhite[0],
                            sizeIcon: 10),
                        Row(
                          children: [
                            IconsText(
                              text: "8 Oct - 9 Oct",
                              icon: Iconsax.calendar,
//Icons.calendar_month_outlined,
                              colorIcon: CustomColors.kWhite[0],
                              sizeIcon: 10,
                              style: Styles.textStyle14W600
                                  .copyWith(color: CustomColors.kWhite[0]),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: CustomColors.kWhite[
                                    0], // Background color of the container
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: Text("form $fromPrice\$",
                                  style: Styles.textStyle10W400),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 11,
            right: 16,
            child: FavoriteButton(),
          ),
        ],
      ),
    );
  }
}
