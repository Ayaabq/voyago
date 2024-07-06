
import 'package:flutter/material.dart';

import '../../../../../../core/utils/validator_manager.dart';
import '../../../../../auth/login/presentation/views/widgets/custom_text_field.dart';


class ContactDetailsSection extends StatelessWidget {
  const ContactDetailsSection({super.key, required this.emailController, required this.phoneController});
  final TextEditingController emailController;
  final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        const Text(
            'We’ll use this information to send you confirmation and upda'
                'tes about your booking.'),
        const SizedBox(
          height: 16,
        ),
        TextFieldCustom(
          controller: emailController,
          hint: "Email",
          onPressedIcon: () {},
          icon: const Icon(Icons.email_outlined),
          keyboardType: TextInputType.emailAddress, validator: (value) =>
                              ValidatorManager().validateEmail(value!),
        ),
        const SizedBox(
          height: 12,
        ),
        TextFieldCustom(
          controller: phoneController,
          hint: "Phone",
          onPressedIcon: () {},
          icon: const Icon(Icons.phone),
          keyboardType: TextInputType.number, validator: (value) =>
                              ValidatorManager().validatePhone(value!),
        ),
      ],
    );
  }
}
