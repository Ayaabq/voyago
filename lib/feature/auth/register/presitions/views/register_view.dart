import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/api.dart';
import 'package:voyago/core/utils/services_locater.dart';

import 'package:voyago/feature/auth/register/data/repo/register_repo_imp.dart';
import 'package:voyago/feature/auth/register/presitions/views/widgets/register_body.dart';

import '../manger/register_cubit/register_cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: RegisterBodyView()),
    );
  }
}
