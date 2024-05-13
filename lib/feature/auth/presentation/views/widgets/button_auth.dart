import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';

import '../../../../../core/utils/styles.dart';

class ButtonAuth extends StatelessWidget {
  const ButtonAuth({super.key, required this.title, required this.onTap});
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.kMove[5],
          foregroundColor: CustomColors.kWhite[0],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
        ),
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: Center(
            child: Text(title,
                textAlign: TextAlign.center, style: Styles.textStyle20W700
                // copyWith(
                //   shadows: [
                //     const Shadow(
                //       color: Colors.white,
                //       blurRadius: 2,
                //       offset: Offset(1, 1),
                //     ),
                //   ],
                // ),
                ),
          ),
        ));
  }
}
