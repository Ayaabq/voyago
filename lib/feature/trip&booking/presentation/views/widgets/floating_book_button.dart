import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_model.dart';

import '../../../../../core/utils/app_router.dart';
import 'over_view_card/icon_text_view.dart';

class FloatingBookButton extends StatelessWidget {
  const FloatingBookButton({super.key,  required this.trip});
  final TripModel trip;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 56.0,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Shadow color with opacity
            spreadRadius: 4, // Spread radius
            blurRadius: 7, // Blur radius
            offset: const Offset(0, 3), // Offset in x and y direction
          ),
        ],
        color: CustomColors.kWhite[3],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0), // Top left border radius
          topRight: Radius.circular(30.0), // Top right border radius
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: IconText(
              icon: Iconsax.coin,
              price: trip.price.toDouble(),
              title: "From ",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kCheckoutView, extra: trip);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColors.kMove[4], // Button color
              foregroundColor: CustomColors.kWhite[0], // Text color
              minimumSize: const Size(160, 35), // Width and height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // Border radius
              ),
            ),
            child: const Text("Book now", style: Styles.textStyle16W700),
          )
        ],
      ),
    );
  }
}
