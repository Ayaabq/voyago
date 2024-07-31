import 'dart:math';

import 'package:flutter/material.dart';
import 'package:voyago/feature/favorite/presentation/views/favorite_icon_button.dart';

import 'package:voyago/feature/home/presentation/views/widgets/offers/offers_details_column.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/screen_size_util.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);

    //   Card(
    //   elevation: 4,
    //   child: Container(
    //
    //     width: ScreenSizeUtil.screenWidth * 0.4,
    //     // height: ScreenSizeUtil.screenHeight  * 0.45,
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(16),
    //     ),
    //     child: Stack(
    //       children: [
    //         Positioned(
    //           top: 8,
    //           right: 8,
    //           left: 8,
    //           bottom: 2,
    //           child: Padding(
    //             padding: const EdgeInsets.symmetric(vertical: 0),
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(16),
    //               child: Image.asset(
    //                 HomeAssets.dummyOffers,
    //                 width: ScreenSizeUtil.screenWidth * 0.35 * 0.8,
    //                 // height: ScreenSizeUtil.screenHeight  * 0. * 0.7,
    //                 fit: BoxFit.cover, // This ensures the image covers the entire area
    //               ),
    //             ),
    //           ),
    //         ),
    //         Container(
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(16),
    //             gradient: const LinearGradient(
    //               begin: Alignment.topCenter,
    //               end: Alignment.bottomCenter,
    //               colors: [
    //                 Colors.transparent,
    //                 Color.fromARGB(0, 255, 255, 255),
    //                 Colors.white,
    //               ],
    //               stops: [
    //                 0.0,
    //                 0.6,
    //                 0.65,
    //               ],
    //             ),
    //           ),
    //         ),
    //         const Positioned(
    //           top: 11,
    //           right: 16,
    //           child: FavoriteButton(),
    //         ),
    //         const Positioned(
    //           top: 110,
    //           // right: 15,
    //           left: 10,
    //           child: OffersDetailsColumn(),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return Card(
      elevation: 4,
      child: Container(
        // Use a fraction of the screen width and height instead of fixed values
        width: max(ScreenSizeUtil.screenWidth * 0.35, 150),
        // height: ScreenSizeUtil.screenHeight  * 0.5,
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
               //   height: ScreenSizeUtil.screenHeight  * 0.3 * 0.7,
                  fit: BoxFit.cover, // This ensures the image covers the entire area
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
            Align(
                alignment:AlignmentDirectional.topEnd,

                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: FavoriteButton(),
                )),

            const Positioned(
              top: 110,
              // right: 15,
              left: 10,
              right: 10,
              child: OffersDetailsColumn(),
            ),
          ],
        ),
      ),
    );
  }
}
