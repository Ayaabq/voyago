import 'package:flutter/material.dart';
import 'package:voyago/feature/forgot_password/presentation/views/widgets/new_password_body.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: NewPasswordBody(),
    );
  }
}
