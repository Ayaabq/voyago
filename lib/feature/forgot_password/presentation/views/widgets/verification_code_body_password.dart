import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:voyago/constants.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/assets.dart';

import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/toast/toast_extensions.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/header_auth.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/text_row.dart';
import 'package:voyago/feature/forgot_password/presentation/manger/codeForgotPass/code_forgot_password_cubit.dart';

import '../../../../auth/login/presentation/views/widgets/custom_text_field.dart';
import '../../../data/models/email_verification_model.dart';

class VerificationPasswordCodeBody extends StatelessWidget {
  VerificationPasswordCodeBody({
    super.key,
    required this.model,
  });

  final TextEditingController codeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final Email model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CodeForgotPasswordCubit, CodeForgotPasswordState>(
          listener: (context, state) {
        if (state is CodeForgotPasswordLoading) {
          context.showLoadingToast();
        } else if (state is CodeForgotPasswordSuccess) {
          // context.showSuccessToast(state.message);
          GoRouter.of(context).pushReplacement(AppRouter.kNewPassword);
        } else if (state is CodeForgotPasswordFailure) {
          context.showFailureToast(state.errorMessage);
        }
      }, builder: (context, state) {
        return ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderAuth(
                  imageUrl: LoginAssets.verificationCode,
                  padding: EdgeInsets.only(top: 48)),
              const SizedBox(height: 36),
              Padding(
                padding: kPaddingHoriz24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Code Verification",
                      style: Styles.textStyle25W700,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Enter the verification code we just sent on your email address",
                      style: Styles.textStyle16W400,
                    ),
                    const SizedBox(height: 18),
                    // const OtpView(),
                    TextFieldCustom(
                   //     controller: codeController,
                        hint: "",
                        onPressedIcon: () {},
                        icon: const Icon(Icons.nineteen_mp_outlined),
                        keyboardType: TextInputType.number,
                        validator:  ( value) {
                          if (value!.length > 5 || value.length < 5) {
                            return "Code mast be 5 char";
                          }
                          value = int.parse(value);
                          model.inCode = value;
                        }),
                    const SizedBox(height: 20),
                    DontAccount(
                        text: "Didn’t receive a code? ",
                        create: "Resend",
                        onTap: () {
                          GoRouter.of(context)
                              .pop();
                        }),
                    SizedBox(height: MediaQuery.of(context).size.height * .26),
                    ButtonAuth(
                        title: "Verify",
                        onTap: () {

                          context
                              .read<CodeForgotPasswordCubit>()
                              .featchCodeForgotPassword(model);

                         
                        }),
                  ],
                ),
              )
            ],
          ),
        ]);
      }),
    );
  }
}



// *******           OTP         *******//////



// class OtpView extends StatelessWidget {
//   const OtpView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Form(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Otp(),
//           Otp(),
//           Otp(),
//           Otp(),
//           Otp(),
//           Otp(),
//         ],
//       ),
//     );
//   }
// }
