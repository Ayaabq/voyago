import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/form_register.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/header_auth.dart';

import 'package:voyago/feature/auth/presentation/views/widgets/text_row.dart';

class RegisterBodyView extends StatelessWidget {
  const RegisterBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderAuth(),
          const SizedBox(height: 11),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome!",
                    style: Styles.textStyle25W700
                        .copyWith(fontWeight: FontWeight.w900)),
                const SizedBox(height: 14),
                Text("Create your Account ",
                    style: Styles.textStyle20W700.copyWith(
                        fontWeight: FontWeight.w800,
                        color: CustomColors.kBlack[3])),
                const SizedBox(height: 32),
                const FormRegister(),
                //const SizedBox(height: 24),
                SizedBox(height: MediaQuery.of(context).size.height * .12),
                ButtonAuth(title: "Sign up", onTap: () {}),
                const SizedBox(height: 14),
                DontAccount(
                  text: "Already have an account? ",
                  create: "Login",
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kLoginView);
                  },
                ),
                //      SizedBox(height: MediaQuery.of(context).size.height * .1),
              ],
            ),
          )
        ],
      ),
    );
  }
}
