import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/constants.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/toast/toast_extensions.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/custom_text_field.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/header_auth.dart';
import 'package:voyago/feature/auth/register/presentation/manger/verifcation_cubits/verification_state.dart';

import '../../../data/models/verification_model.dart';
import '../../manger/verifcation_cubits/verifcation_cubit.dart';

class VerificationSginUpBody extends StatelessWidget {
  VerificationSginUpBody({
    super.key,
    required this.verificationData,
  });

  final TextEditingController code = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final VerificationModel verificationData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerificationRegister(verificationData: verificationData),
    );
  }
}

class VerificationRegister extends StatelessWidget {
  const VerificationRegister({
    super.key,
    required this.verificationData,
  });

  final VerificationModel verificationData;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) {
        if (state is VerificationLoading) {
          context.showLoadingToast();
        } else if (state is VerificationSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kSuccessSginUp);
        } else if (state is VerificationFailure) {
          context.showFailureToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        return ListView(children: [
          Column(
            children: [
              const HeaderAuth(
                  imageUrl: LoginAssets.verificationCode,
                  padding: EdgeInsets.only(top: 48)),
              const SizedBox(height: 36),
              // TextFormField(onChanged: (value) {
              //   verificationData.inCode = value;
              // }),
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
                    TextFieldCustom(
                        hint: "",
                        onPressedIcon: () {},
                        icon: const Icon(Icons.nineteen_mp_outlined),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.length > 5 || value.length < 5) {
                            return "Code mast be 5 char";
                          }
                          verificationData.inCode = value;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    // DontAccount(
                    //     text: "Didn’t receive a code? ",
                    //     create: "Resend",
                    //     onTap: () {
                    //       GoRouter.of(context).pop();
                    //     }),
                    SizedBox(height: MediaQuery.of(context).size.height * .26),
                    ButtonAuth(
                        title: "Verify",
                        onTap: () {
                          context
                              .read<VerificationCubit>()
                              .verifyCode(verificationData);
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ]);
          },
    );
  }
}
