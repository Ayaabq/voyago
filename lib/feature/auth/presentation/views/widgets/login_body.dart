import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/header_auth.dart';
import 'package:iconsax/iconsax.dart';

class LoginBodyView extends StatelessWidget {
  const LoginBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderAuth(),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back!",
                  style: Styles.textStyle25W700,
                ),
                const SizedBox(height: 32),
                const FormLogin(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forgot your password?",
                          style: Styles.textStyle16W700
                              .copyWith(color: CustomColors.kMove[6]),
                        ))
                  ],
                ),
                SizedBox(height: ScreenSizeUtil.screenHeight * 0.28),
                ButtonAuth(title: "Login", onTap: () {}),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Text(
                      "Don't  have an account? ",
                      style: Styles.textStyle16W400
                          .copyWith(fontWeight: FontWeight.w500)
                          .copyWith(color: CustomColors.kBlack[3]),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Create Now",
                        style: Styles.textStyle16W700.copyWith(
                            color: CustomColors.kMove[7],
                            fontWeight: FontWeight.w900),
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
                ),
              ],
            ),
          ),
          // SizedBox(height: ScreenSizeUtil.screenHeight * .2),
        ],
      ),
    );
  }
}

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFieldCustom(
          hint: "Email",
          icon: const Icon(Icons.email_outlined),
          onPressedIcon: () {},
        ),
        const SizedBox(height: 28),
        TextFieldCustom(
          hint: "Password",
          icon: const Icon(Iconsax.eye_slash),
          onPressedIcon: () {},
        )
      ],
    ));
  }
}
// login 700 20
//Don't  have an account? 400 16
//Create Now 700 16