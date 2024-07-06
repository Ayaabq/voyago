import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/toast/toast_extensions.dart';
import 'package:voyago/feature/auth/login/data/model/login_model.dart';
import 'package:voyago/feature/auth/login/manger/login_cubit/login_cubit.dart';
import 'package:voyago/feature/auth/login/manger/login_cubit/login_state.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/form_login.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/header_auth.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/text_row.dart';
import 'package:voyago/generated/assets.dart';

import '../../../../../../core/utils/validator_manager.dart';
import 'custom_text_field.dart';

class LoginBodyView extends StatelessWidget {
  LoginBodyView({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          context.showLoadingToast();
        } else if (state is LoginSuccess) {
          GoRouter.of(context).push(AppRouter.kHomeView);
        }
        if (state is LoginFailure) {
          context.showFailureToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        return ListView(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const HeaderAuth(
              imageUrl: AssetsData.logoAllColors,
              padding: EdgeInsets.only(top: 66),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome back!",
                      style: Styles.textStyle25W700
                          .copyWith(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 20),
                  //  const FormLogin(),

                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFieldCustom(
                          controller: usernameController,
                          hint: "Name",
                          icon: const Icon(Icons.email_outlined),
                          onPressedIcon: () {},
                          keyboardType: TextInputType.name,
                          validator: (value) =>
                              ValidatorManager().validateName(value!),
                        ),
                        const SizedBox(height: 20),
                        TextFieldCustom(
                          obscureText: true,
                          controller: passwordController,
                          hint: "Password",
                          icon: const Icon(Icons.remove_red_eye_outlined),
                          onPressedIcon: () {},
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) =>
                              ValidatorManager().validatePassword(value!),
                        ),

                        //8
                        const SizedBox(height: 16),
                        const ForGot(),
                        SizedBox(height: ScreenSizeUtil.screenHeight * .22),
                        ButtonAuth(
                            title: "Login",
                            onTap: () {
                              //   GoRouter.of(context).push(AppRouter.kHomeView);
                              if (formKey.currentState!.validate()) {
                                final loginModel = LoginModel(
                                  username: usernameController.text,
                                  password: passwordController.text,
                                );
                                print(loginModel);
                                context.read<LoginCubit>().fetchLogin(
                                    usernameController.text,
                                    passwordController.text);
                              }
                            }),
                        const SizedBox(height: 10),
                        ButtonAuth(
                            title: "لا تكبس هون",
                            onTap: () {
                              GoRouter.of(context).push(AppRouter.kHomeView);
                            }),
                        const SizedBox(height: 10),
                        DontAccount(
                          text: "Don't have an account? ",
                          create: "Create Now",
                          onTap: () {
                            GoRouter.of(context).push(AppRouter.kRegisterView);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenSizeUtil.screenHeight * 0.1),
                ],
              ),
            )
          ])
        ]);
      },
    );
  }
}
