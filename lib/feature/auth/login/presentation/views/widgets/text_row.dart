import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
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
            onTap: () {
              GoRouter.of(context).push(AppRouter.kForgotPasswordView);
            },
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
    required this.text,
    required this.create,
    required this.onTap,
  });
  final String text;
  final String create;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text
          // "Don't  have an account? "
          ,
          style: Theme.of(context).brightness == Brightness.dark
              ? Styles.textStyle16W400
                  .copyWith(fontWeight: FontWeight.w500)
                  .copyWith(
                      color: CustomColors.kWhite[0],
                      fontSize: ScreenSizeUtil.screenWidth * 0.04)
              : Styles.textStyle16W400
                  .copyWith(fontWeight: FontWeight.w500)
                  .copyWith(
                      color: CustomColors.kBlack[3],
                      fontSize: ScreenSizeUtil.screenWidth * 0.04),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            create
            // "Create Now"
            ,
            style: Styles.textStyle16W700.copyWith(
                color: CustomColors.kMove[7],
                fontWeight: FontWeight.w900,
                fontSize: ScreenSizeUtil.screenWidth * 0.03),
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

//text rich
class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(text: "Dont Have An Account?"),
    );
  }
}
