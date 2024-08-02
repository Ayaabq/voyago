import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/profile/data/repo/profile_repo_impl.dart';
import 'package:voyago/feature/profile/presentation/manager/profile/info_profile/info_profile_cubit.dart';

import '../../../../core/utils/services_locater.dart';
import 'widgets/personal_info_body.dart';

class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: BlocProvider(
      create: (context) => UserCubit(getIt.get<ProfileRepoImpl>()),
      child: const PersonalInformationBody(),
    ));
  }
}
