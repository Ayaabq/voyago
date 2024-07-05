// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/toast/toast_extensions.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/custom_text_field.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/header_auth.dart';
import 'package:voyago/feature/forgot_password/presentation/manger/codeForgotPass/code_forgot_password_cubit.dart';

import '../../../../../core/utils/services_locater.dart';
import '../../../../../core/utils/validator_manager.dart';
import '../../../../auth/register/data/repo/auth_register_repo_imp.dart';
import '../../../data/models/email_verification_model.dart';
import '../../manger/fprgot_pass/forgotPasswordCubit/forgot_password_cubit.dart';
import 'verification_code_body_password.dart';

class ForgotPasswordBody extends StatelessWidget {
  ForgotPasswordBody({super.key});

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
      if (state is ForgotPasswordLoading) {
        context.showLoadingToast();
      } else if (state is ForgotPasswordSuccess) {
        final emaill = Email(email: emailController.text);
        // context.showSuccessToast(state.message);
        // GoRouter.of(context)
        //     .push(AppRouter.kVerificationCodeView, extra: emaill);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) =>
                  CodeForgotPasswordCubit(getIt.get<AuthRepoImp>()),
              child: VerificationPasswordCodeBody(
                model: emaill,
              ),
            ),
          ),
        );
      } else if (state is ForgotPasswordFailure) {
        context.showFailureToast(state.errorMessage);
      }
    }, builder: (context, state) {
      return ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderAuth(
              imageUrl: LoginAssets.forgot,
              padding: EdgeInsets.only(top: 42),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: Styles.textStyle25W700,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                        "Don’t worry you can get a new one Please enter the email address linked with your email"),
                    const SizedBox(height: 40),
                    TextFieldCustom(
                        controller: emailController,
                        hint: "Email",
                        onPressedIcon: () {},
                        icon: const Icon(Icons.email_outlined),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            ValidatorManager().validateEmail(value!)),
                    SizedBox(height: MediaQuery.of(context).size.height * .26),
                    ButtonAuth(
                        title: "Send code",
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context
                                .read<ForgotPasswordCubit>()
                                .featchForgotPassword(emailController.text);
                          }

                          //go otp
                          // GoRouter.of(context)
                          //     .push(AppRouter.kVerificationCodeView);
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]);
    });
  }
}

