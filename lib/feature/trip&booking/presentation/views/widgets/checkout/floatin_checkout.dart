import 'package:flutter/material.dart';

import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';

class FloatingCheckout extends StatelessWidget {
  const FloatingCheckout({super.key, required this.currentPage, required this.onBackTapped, required this.onNextTapped, required this.onBookTapped});
  final int currentPage;
  final void Function() onBackTapped;
  final void Function() onNextTapped;
  final void Function() onBookTapped;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        if(currentPage>=1)
          Expanded(
            child: ElevatedButton(
              onPressed:onBackTapped,
              style: ElevatedButton.styleFrom(
                foregroundColor: CustomColors.kMove[4], // Button color
                backgroundColor: CustomColors.kWhite[0], // Text color
                minimumSize: const Size(double.infinity, 35), // Width and height
                maximumSize: const Size(double.infinity, 35), // Width and height
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // Border radius
                    side: BorderSide(color: CustomColors.kMove[4])
                ),
              ),
              child:const Text("Back", style: Styles.textStyle16W700),
            ),
          ),
        const SizedBox(width: 16,),
        Expanded(
          child: ElevatedButton(
            onPressed:currentPage<2?onNextTapped:onBookTapped,
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColors.kMove[4], // Button color
              foregroundColor: CustomColors.kWhite[0], // Text color
              minimumSize: const Size(double.infinity, 35), // Width and height
              maximumSize: const Size(double.infinity, 35), // Width and height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // Border radius
              ),
            ),
            child: Text(currentPage<2?"Next":"Book", style: Styles.textStyle16W700),
          ),
        ),

      ],
    );
  }
}
