import 'package:flutter/material.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/header_auth.dart';
import 'package:iconsax/iconsax.dart';

class LoginBodyView extends StatelessWidget {
  const LoginBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderAuth(),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back!",
                  style: Styles.textStyle25W700,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
          Form(
              child: Column(
            children: [
              TextFormField(
                decoration:
                    InputDecoration(suffixIcon: Icon(Iconsax.direct_inbox)),
              )
            ],
          ))
        ],
      ),
    );
  }
}
