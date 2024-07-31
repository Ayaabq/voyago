import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/services_locater.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/toast/toast_extensions.dart';
import 'package:voyago/feature/auth/register/data/models/verification_model.dart';
import 'package:voyago/feature/auth/register/data/repo/auth_register_repo_imp.dart';
import 'package:voyago/feature/auth/register/presentation/manger/register_cubit/register_cubit.dart';
import 'package:voyago/feature/auth/register/presentation/manger/register_cubit/register_state.dart';
import 'package:voyago/feature/auth/register/presentation/manger/verifcation_cubits/verifcation_cubit.dart';
import 'package:voyago/feature/auth/register/presentation/views/widgets/form_register.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/header_auth.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/text_row.dart';
import 'package:voyago/feature/auth/register/presentation/views/widgets/verification_sginup_body.dart';

import '../../../../../theme/widgets/cubit/app_theme_cubit.dart';

class RegisterBodyView extends StatefulWidget {
  const RegisterBodyView({super.key});

  @override
  State<RegisterBodyView> createState() => _RegisterBodyViewState();
}

class _RegisterBodyViewState extends State<RegisterBodyView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is RegisterLoading) {
        context.showLoadingToast();
      } else if (state is RegisterSuccess) {
        context.showSuccessToast(state.message);

        final correctCode = state.correctCode;
        final verificationData = VerificationModel(
          correctCode: correctCode,
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => VerificationCubit(getIt.get<AuthRepoImp>()),
              child: VerificationSginUpBody(verificationData: verificationData),
            ),
          ),
        );

//state.correctCode,VerificationModel
      } else if (state is RegisterFailure) {
        context.showFailureToast(state.errorMessage);
      } else {
        context.showErrorToast();
      }
    }, builder: (context, state) {
      return ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderAuth(
              imageUrl: Theme.of(context).brightness == Brightness.dark
                  ? AssetsData.miniLogo
                  : AssetsData.logoAllColors,
              padding: const EdgeInsets.only(top: 50),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome!".tr(), style: Styles.textStyle25W700),
                  const SizedBox(height: 14),

                  Text("Create your Account ".tr(),
                      style: Styles.textStyle20W700.copyWith(
                          fontWeight: FontWeight.w600,
                          color: CustomColors.kBlack[3])),

                  const SizedBox(height: 24),
                  //88

                  FormReg(
                    formKey: formKey,
                    usernameController: usernameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                  ),

                  //const SizedBox(height: 24),
                  SizedBox(height: MediaQuery.of(context).size.height * .1),

                  const SizedBox(height: 10),
                  DontAccount(
                    text: "Already have an account? ".tr(),
                    create: "Login".tr(),
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kLoginView);
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
