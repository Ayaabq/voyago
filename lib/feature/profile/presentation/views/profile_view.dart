import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/profile/data/models/profile_model.dart';
import 'package:voyago/feature/profile/data/repo/profile_repo_impl.dart';
import 'package:voyago/feature/profile/presentation/manager/profile/profile_main/profile_cubit.dart';

import '../../../../core/utils/services_locater.dart';
import 'widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
 const ProfileView({super.key,});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) =>
          ProfileCubit(getIt.get<ProfileRepoImpl>())..fetchProfile(),
      child: const ProfileBody(),
    ));
  }
}
