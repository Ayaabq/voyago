import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/feature/profile/presentation/views/widgets/info_user.dart';

import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../../../auth/login/presentation/views/widgets/button_auth.dart';
import 'appbar_profile.dart';
import 'edit_image_prof.dart';

class PersonalInformationBody extends StatelessWidget {
  const PersonalInformationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProfileAppBar(
            titel: 'My Personal Information',
          ),
          const SizedBox(height: 30),
          const ProfilePictureEdit(),
          const SizedBox(height: 30),
          const InformationRow(
            icon: Iconsax.user,
            label: 'User name',
            value: 'Ayalmalla',
          ),
          Divider(
            color: CustomColors.kGrey[0],
          ),
          const InformationRow(
            icon: Icons.email_outlined,
            label: 'Email',
            value: 'ayalmallah@gmail.com',
          ),
          Divider(
            color: CustomColors.kGrey[0],
          ),
          const InformationRow(
            icon: Icons.phone,
            label: 'Phone Number',
            value: '0964682070',
          ),
          Divider(
            color: CustomColors.kGrey[0],
          ),
          const InformationRow(
            icon: Icons.location_on,
            label: 'Hometown',
            value: 'Damascus, Syria',
          ),
          Divider(
            color: CustomColors.kGrey[0],
          ),
          SizedBox(
            height: ScreenSizeUtil.screenHeight * 0.15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ButtonAuth(
                title: "Edit my personal informations",
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kEditProfileView);
                }),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ButtonAuth(title: "Change my password", onTap: () {}),
          )
        ],
      ),
    );
  }
}
