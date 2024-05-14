import 'package:flutter/material.dart';

import 'custom_text_field.dart';

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
        const SizedBox(height: 20),
        TextFieldCustom(
          hint: "Password",
          icon: const Icon(Icons.remove_red_eye_outlined),
          onPressedIcon: () {},
        )
      ],
    ));
  }
}
