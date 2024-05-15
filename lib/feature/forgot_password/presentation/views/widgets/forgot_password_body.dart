import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/header_auth.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderAuth(
            imageUrl: LoginAssets.forgot,
            padding: EdgeInsets.only(top: 42),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forgot Password?",
                  style: Styles.textStyle25W700,
                ),
                const SizedBox(height: 16),
                const Text(
                    "Don’t worry you can get a new one Please enter the email address linked with your email"),
                const SizedBox(height: 40),
                TextFieldCustom(
                    hint: "Email",
                    onPressedIcon: () {},
                    icon: const Icon(Icons.email_outlined), keyboardType: TextInputType.emailAddress,),
                SizedBox(height: MediaQuery.of(context).size.height * .26),
                ButtonAuth(
                    title: "Send code",
                    onTap: () {
                      //go otp
                      GoRouter.of(context)
                          .push(AppRouter.kVerificationCodeView);
                    }),
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}
