import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';

import '../../../../../core/utils/styles.dart';

class ButtonAuth extends StatelessWidget {
  const ButtonAuth(
      {super.key,
      required this.title,
      required this.onTap,
      this.isLoading = false, this.onPressed});
  final String title;
  final void Function() onTap;
  final bool isLoading;
  final void Function()? onPressed;
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
            child: isLoading
                ? CircularProgressIndicator(color: CustomColors.kWhite[0])
                : Text(title,
                    textAlign: TextAlign.center, style: Styles.textStyle20W700),
          ),
        ));
  }
}
