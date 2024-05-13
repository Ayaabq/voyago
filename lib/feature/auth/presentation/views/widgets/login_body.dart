import 'package:flutter/material.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/from.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/header_auth.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/text_row.dart';

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
                Text("Welcome back!",
                    style: Styles.textStyle25W700
                        .copyWith(fontWeight: FontWeight.w800)),
                const SizedBox(height: 32),
                const FormLogin(),
                const SizedBox(height: 20),
                const ForGot(),
                SizedBox(height: ScreenSizeUtil.screenHeight * 0.28),
                ButtonAuth(title: "Login", onTap: () {}),
                const SizedBox(height: 14),
                const DontAccount(),
              ],
            ),
          ),
          // SizedBox(height: ScreenSizeUtil.screenHeight * .2),
        ],
      ),
    );
  }
}
