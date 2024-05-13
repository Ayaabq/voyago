import 'package:flutter/material.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterBodyView(),
    );
  }
}
