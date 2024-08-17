import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';

import '../../../../auth/login/presentation/views/widgets/button_auth.dart';
import '../../../imagess/image_cubit.dart';
import 'appbar_profile.dart';
import 'edit_image_prof.dart';
import 'info_column_profile.dart';

class PersonalInformationBody extends StatelessWidget {
  const PersonalInformationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileAppBar(
            titel: "My Personal Information".tr(),
          ),
          const SizedBox(height: 30),
          // BlocProvider(
          //   create: (context) => ProfilePictureCubit(),
          //   child: const ProfilePictureEdit(),
          // ),
          const SizedBox(height: 30),
          const InfoColumn(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ButtonAuth(
                title: "Edit my personal informations".tr(),
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kEditProfileView);
                }),
          ),
          // const SizedBox(height: 10),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: ButtonAuth(title: "Change my password".tr(), onTap: () {}),
          // )
        ],
      ),
    );
  }
}
