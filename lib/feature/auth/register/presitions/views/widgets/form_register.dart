import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:voyago/feature/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:regexpattern/regexpattern.dart';

class FormRegister extends StatelessWidget {
  FormRegister({
    super.key,
  });
  final GlobalKey<FormState> formKey = GlobalKey();
//   final TextEditingController usernameController;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldCustom(
          controller: usernameController,
          hint: "User name",
          onPressedIcon: () {},
          icon: const Icon(FontAwesomeIcons.user),
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 12),
        TextFieldCustom(
          controller: emailController,
          hint: "Email",
          onPressedIcon: () {},
          icon: const Icon(Icons.email_outlined),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 12),
        // TextFieldCustom(
        //   hint: "Phone",
        //   onPressedIcon: () {},
        //   icon: const Icon(
        //     Icons.phone_outlined,
        //   ),
        //   keyboardType: TextInputType.number,
        // ),
        //const SizedBox(height: 12),
        TextFieldCustom(
          controller: passwordController,
          hint: "Password",
          onPressedIcon: () {},
          icon: const Icon(Icons.remove_red_eye_outlined),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
        ),
        const SizedBox(height: 12),
        TextFieldCustom(
          controller: confirmPasswordController,
          hint: "confirm password",
          onPressedIcon: () {},
          icon: const Icon(Icons.visibility_off_outlined),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
        ),
      ],
    );
  }
}
