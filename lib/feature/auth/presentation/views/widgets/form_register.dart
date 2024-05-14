import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/custom_text_field.dart';

class FormRegister extends StatelessWidget {
  const FormRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldCustom(
            hint: "User name",
            onPressedIcon: () {},
            icon: const Icon(FontAwesomeIcons.user)),
        const SizedBox(height: 22),
        TextFieldCustom(
            hint: "Email",
            onPressedIcon: () {},
            icon: const Icon(Icons.email_outlined)),
        const SizedBox(height: 22),
        TextFieldCustom(
            hint: "Phone",
            onPressedIcon: () {},
            icon: const Icon(
              Icons.phone_outlined,
              //     size: 28,
            )),
        const SizedBox(height: 20),
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
