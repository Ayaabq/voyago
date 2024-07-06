import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/forgot_password/presentation/manger/codeForgotPass/code_forgot_password_cubit.dart';
import 'package:voyago/feature/forgot_password/presentation/views/widgets/verification_code_body_password.dart';

import '../../../../core/utils/services_locater.dart';
import '../../../auth/register/data/repo/auth_register_repo_imp.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    //final email = GoRouter.of(context).state.extra as String; // استقبال البريد الإلكتروني
    //final email = (GoRouter.of(context).extra as String?) ?? '';
    dynamic email;
    return Scaffold(
        body: BlocProvider(
      create: (context) => CodeForgotPasswordCubit(getIt.get<AuthRepoImp>()),
      child: VerificationPasswordCodeBody(
        model: email,
      ),
    ));
  }
}
