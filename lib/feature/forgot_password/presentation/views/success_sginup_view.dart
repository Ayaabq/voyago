import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/constants.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';

class SuccessSginUpView extends StatelessWidget {
  const SuccessSginUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 118),
            child: AspectRatio(
              aspectRatio: 2.2,
              child: Image(
                image: AssetImage(LoginAssets.successSginUp),
              ),
            ),
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              textAlign: TextAlign.center,
              "Your account has been created successfully",
              style: Styles.textStyle25W700,
            ),
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              textAlign: TextAlign.center,
              "Please login now and enjoy using Voyago",
              style: Styles.textStyle18W400.copyWith(fontSize: 20),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .26),
          Padding(
            padding: kPaddingHoriz24,
            child: ButtonAuth(
                title: "Login",
                onTap: () {
                  GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
                }),
          ),
        ],
      ),
    );
  }
}
