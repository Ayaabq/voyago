import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:voyago/constants.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/assets.dart';

import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/header_auth.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/text_row.dart';
import 'package:voyago/feature/forgot_password/presentation/views/widgets/otp.dart';

class VerificationPasswordCodeBody extends StatelessWidget {
  const VerificationPasswordCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderAuth(
              imageUrl: LoginAssets.verificationCode,
              padding: EdgeInsets.only(top: 48)),
          const SizedBox(height: 36),
          Padding(
            padding: kPaddingHoriz24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Code Verification",
                  style: Styles.textStyle25W700,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Enter the verification code we just sent on your email address",
                  style: Styles.textStyle16W400,
                ),
                const SizedBox(height: 18),
                const OtpView(),
                const SizedBox(height: 20),
                DontAccount(
                    text: "Didn’t receive a code? ",
                    create: "Resend",
                    onTap: () {
                      GoRouter.of(context)
                          .pushReplacement(AppRouter.kVerificationCodeView);
                    }),
                SizedBox(height: MediaQuery.of(context).size.height * .26),
                ButtonAuth(
                    title: "Verify",
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kNewPassword);
                    }),
              ],
            ),
          )
        ],
      ),
    ]);
  }
}

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Otp(),
          Otp(),
          Otp(),
          Otp(),
          Otp(),
          Otp(),
        ],
      ),
    );
  }
}
