import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/header_auth.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';

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
                TextFieldCustom(
                    hint: "User name",
                    onPressedIcon: () {},
                    icon: const Icon(FontAwesomeIcons.userAstronaut)),
                const SizedBox(height: 22),
                const FormRegister()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FormRegister extends StatelessWidget {
  const FormRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldCustom(
            hint: "Email",
            onPressedIcon: () {},
            icon: const Icon(Iconsax.profile)),
        const SizedBox(height: 22),
        TextFieldCustom(
            hint: "Phone",
            onPressedIcon: () {},
            icon: const Icon(FontAwesomeIcons.phone)),
        const SizedBox(height: 22),
        TextFieldCustom(
            hint: "Password",
            onPressedIcon: () {},
            icon: const Icon(FontAwesomeIcons.eyeSlash)),
        const SizedBox(height: 22),
        TextFieldCustom(
            hint: "confirm password",
            onPressedIcon: () {},
            icon: const Icon(FontAwesomeIcons.eyeSlash)),
      ],
    );
  }
}
