import 'package:flutter/material.dart';
import 'package:voyago/feature/forgot_password/presentation/views/widgets/verification_code_body_password.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: VerificationPasswordCodeBody());
  }
}
