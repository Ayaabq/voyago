import 'package:flutter/material.dart';

import '../../utils/assets.dart';
import '../../utils/custom_colors.dart';
import '../../utils/styles.dart';

class PleaseWaitDialog extends StatelessWidget {
  const PleaseWaitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Please wait!',
              style: Theme.of(context).brightness == Brightness.dark
                  ? Styles.textStyle20W700.copyWith(
                      fontWeight: FontWeight.w600,
                      color: CustomColors.kWhite[0])
                  : Styles.textStyle20W700.copyWith(
                      fontWeight: FontWeight.w600,
                      color: CustomColors.kMove[9])),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(
              Wallet.wattingDialog,
              width: 230,
              height: 185,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
