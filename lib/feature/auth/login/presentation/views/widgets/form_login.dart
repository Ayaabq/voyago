import 'package:flutter/material.dart';

import '../../../../../../core/utils/validator_manager.dart';
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

          hint: "Name",
          icon: const Icon(Icons.email_outlined),
          onPressedIcon: () {}, keyboardType: TextInputType.name, validator:(value) => ValidatorManager().validateName(value!),
        ),
        const SizedBox(height: 20),
        TextFieldCustom(
       
obscureText: true,
          hint: "Password",
          icon: const Icon(Icons.remove_red_eye_outlined),
          onPressedIcon: () {}, keyboardType: TextInputType.visiblePassword, validator:(value) => ValidatorManager().validatePassword(value!),
        )
      ],
    ));
  }
}
