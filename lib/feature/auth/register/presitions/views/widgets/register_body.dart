import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/auth/register/data/models/register_model.dart';
import 'package:voyago/feature/auth/register/presitions/manger/register_cubit/register_cubit.dart';
import 'package:voyago/feature/auth/register/presitions/manger/register_cubit/register_state.dart';
import 'package:voyago/feature/auth/register/presitions/views/widgets/form_register.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/header_auth.dart';

import 'package:voyago/feature/auth/presentation/views/widgets/text_row.dart';

class RegisterBodyView extends StatefulWidget {
  const RegisterBodyView({super.key});

  @override
  State<RegisterBodyView> createState() => _RegisterBodyViewState();
}

class _RegisterBodyViewState extends State<RegisterBodyView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is RegisterLoading) {
        print("loding");
      } else if (state is RegisterSuccess) {
        print("scuss");

        GoRouter.of(context).push(
          AppRouter.kForgotPasswordView,
//extra:state.message
       );
      } else if (state is RegisterFailure) {
        print(state.errorMessage);

        // RegisterFailure(state.errorMessage);
      } else {
        print("eror404");
      }
    }, builder: (context, state) {
      return ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderAuth(
              imageUrl: AssetsData.logoAllColors,
              padding: EdgeInsets.only(top: 50),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome!", style: Styles.textStyle25W700),
                  const SizedBox(height: 14),
                  Text("Create your Account ",
                      style: Styles.textStyle20W700.copyWith(
                          fontWeight: FontWeight.w600,
                          color: CustomColors.kBlack[3])),
                  const SizedBox(height: 22),
                  FormRegister(),
                  //const SizedBox(height: 24),
                  SizedBox(height: MediaQuery.of(context).size.height * .1),
//                 ButtonAuth(
//                     title: "Sign up",
//                     onTap: () {
//                       GoRouter.of(context)
//                           .pushReplacement(AppRouter.kVerificationSginUpView);
//                     },

// //  onPressed: () {
// //                       BlocProvider.of<RegisterCubit>(context).featchRegister(
// //                         usernameController.text,
// //                         emailController.text,
// //                         passwordController.text,
// //                         confirmPasswordController.text,
// //                       );
// //                     },
// ),
                  const SizedBox(height: 10),
                  DontAccount(
                    text: "Already have an account? ",
                    create: "Login",
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kLoginView );
                    },
                  ),
                  const SizedBox(height: 18)
                  //    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                ],
              ),
            )
          ],
        ),
      ]);
    });
  }
}

class DefoultDelgo extends StatelessWidget {
  const DefoultDelgo({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefoultDelgo(

);
  }
}
