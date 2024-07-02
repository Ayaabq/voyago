import 'package:flutter/material.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/reviews/make_review.dart';

import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';

class FloatingAddReview extends StatelessWidget {
  const FloatingAddReview({super.key, this.onPressed, this.title});
  final void Function()? onPressed;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return  Container(
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          ElevatedButton(
            onPressed: onPressed??() {
              showModalBottomSheet(context: context, builder: (context)=>MakeReview());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColors.kMove[4], // Button color
              foregroundColor: CustomColors.kWhite[0], // Text color
              minimumSize: const Size(320, 35), // Width and height
              maximumSize: const Size(320, 35), // Width and height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // Border radius
              ),
            ),
            child:Text(title??"Write a Review", style: Styles.textStyle16W700),
          )
        ],
      ),
    );
  }
}
