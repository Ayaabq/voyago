import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:voyago/feature/auth/login/data/repo/login_repo_impl.dart';
import 'package:voyago/feature/auth/login/manger/login_cubit/login_cubit.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/login_body.dart';

import '../../../../../core/utils/services_locater.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              Theme.of(context).brightness == Brightness.dark
                  ? Brightness.light
                  : Brightness.dark,
        ),
        child: SafeArea(
            child: BlocProvider(
          create: (context) => LoginCubit(
              getIt.get<LoginRepoImp>(), const FlutterSecureStorage()),
          child: LoginBodyView(),
        )),
      ),
    );
  }
}
