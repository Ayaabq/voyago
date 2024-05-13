import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';

class ForGot extends StatelessWidget {
  const ForGot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {},
            child: Text(
              "Forgot your password?",
              style: Styles.textStyle16W700.copyWith(
                  color: CustomColors.kMove[6], fontWeight: FontWeight.w800),
            ))
      ],
    );
  }
}

class DontAccount extends StatelessWidget {
  const DontAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Don't  have an account? ",
          style: Styles.textStyle16W400
              .copyWith(fontWeight: FontWeight.w500)
              .copyWith(color: CustomColors.kBlack[3]),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kRegisterView);
          },
          child: Text(
            "Create Now",
            style: Styles.textStyle16W700.copyWith(
                color: CustomColors.kMove[7], fontWeight: FontWeight.w900),
          ),
        ),

        // TextButton(
        //   onPressed: () {},
        //   child: Text(
        //     "Create Now",
        //     style: Styles.textStyle16W700.copyWith(
        //         color: CustomColors.kMove[7],
        //         fontWeight: FontWeight.w900),
        //   ),
        // ),
      ],
    );
  }
}
