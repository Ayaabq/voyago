import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/widgets/favorite_icon_button.dart';
import 'package:voyago/core/widgets/location_with_country.dart';
import 'package:voyago/core/widgets/price_offer_display.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_rate.dart';
class CustomCardBackground extends StatelessWidget {
  const CustomCardBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        elevation: 4,
        child: Container(

          width: 150,
          height: 160,
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
                      width: 130,
                      height: 150,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 130,
                      height: 148,
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,

                            children: [
                              Text("Damas hotel",
                                style: Styles.textStyle12W400,),
                              Spacer(),
                              CustomRating(rate: 4.2),
                            ],
                          ),
                          LocationWithCountry(country: "Damascus"),
                          PriceDisplay(oldPrice: "90\$", newPrice: "85\$", ratio: 10,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
