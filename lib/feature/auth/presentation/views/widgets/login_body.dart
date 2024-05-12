import 'package:flutter/material.dart';
import 'package:voyago/core/utils/styles.dart';
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
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot your password?",
                            style: Styles.textStyle16W700
                                .copyWith(color: const Color(0xff5E4DA7)),
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
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
          icon: const Icon(Iconsax.add),
          onPressedIcon: () {},
        ),
        const SizedBox(height: 28),
        TextFieldCustom(
          hint: "Password",
          icon: const Icon(Iconsax.password_check),
          onPressedIcon: () {},
        )
      ],
    ));
  }
}
// login 700 20
//Don't  have an account? 400 16
//Create Now 700 16