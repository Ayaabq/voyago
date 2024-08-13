import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/profile/presentation/manager/profile/edit_profile/cubit/edit_profile_cubit.dart';
import '../../../../core/utils/services_locater.dart';
import '../../data/models/user_model.dart';
import '../../data/repo/profile_repo_impl.dart';
import 'widgets/edit_profile_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(getIt.get<ProfileRepoImpl>()),
      child: const EditProfileBody(),
    );
  }
}
