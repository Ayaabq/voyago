import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/constants.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/header_auth.dart';

class NewPasswordBody extends StatelessWidget {
  const NewPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            const HeaderAuth(
                imageUrl: LoginAssets.newpassword,
                padding: EdgeInsets.only(top: 60)),
            const SizedBox(height: 20),
            Padding(
              padding: kPaddingHoriz24,
              child: Column(
                children: [
                  Text(
                    "Create new password",
                    style: Styles.textStyle25W700,
                  ),
                  const SizedBox(height: 38),
                  TextFieldCustom(
                      hint: "password",
                      onPressedIcon: () {},
                      icon: const Icon(Icons.visibility_off_outlined)),
                  const SizedBox(height: 16),
                  TextFieldCustom(
                      hint: "confirm password",
                      onPressedIcon: () {},
                      icon: const Icon(Icons.visibility_off_outlined)),
                  SizedBox(height: MediaQuery.of(context).size.height * .26),
                  ButtonAuth(
                      title: "Reset Password",
                      onTap: () {
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.kSuccessPasswor);
                      }),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
