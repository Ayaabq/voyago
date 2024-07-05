import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/services_locater.dart';
import 'package:voyago/feature/forgot_password/presentation/manger/fprgot_pass/forgotPasswordCubit/forgot_password_cubit.dart';
import 'package:voyago/feature/forgot_password/presentation/views/widgets/forgot_password_body.dart';

import '../../../auth/register/data/repo/auth_register_repo_imp.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => ForgotPasswordCubit(getIt.get<AuthRepoImp>()),
      child: ForgotPasswordBody(),
    ));
  }
}
