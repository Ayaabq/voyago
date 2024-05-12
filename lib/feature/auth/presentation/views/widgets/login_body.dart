import 'package:flutter/material.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/header_auth.dart';

class LoginBodyView extends StatelessWidget {
  const LoginBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderAuth(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back!",
                  style: Styles.textStyle25W700,
                ),
                SizedBox(height: 12),
                // Text(
                //   "Create your Account ",
                //   style: TextStyle(fontSize: 20),
                // ),
                SizedBox(height: 32),
              ],
            ),
          )
        ],
      ),
    );
  }
}
