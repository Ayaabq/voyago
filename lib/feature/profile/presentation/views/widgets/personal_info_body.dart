import 'package:easy_localization/easy_localization.dart';
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
           ProfileAppBar(
            titel: "My Personal Information".tr(),
          ),
          const SizedBox(height: 30),
          const ProfilePictureEdit(),
          const SizedBox(height: 30),
           InformationRow(
            icon: Iconsax.user,
            label: 'User name'.tr(),
            value: 'Ayalmalla',
          ),
          Divider(
            color: CustomColors.kGrey[0],
          ),
           InformationRow(
            icon: Icons.email_outlined,
            label: 'Email'.tr(),
            value: 'ayalmallah@gmail.com',
          ),
          Divider(
            color: CustomColors.kGrey[0],
          ),
           InformationRow(
            icon: Icons.phone,
            label: 'Phone Number'.tr(),
            value: '0964682070',
          ),
          Divider(
            color: CustomColors.kGrey[0],
          ),
           InformationRow(
            icon: Icons.location_on,
            label: 'Hometown'.tr(),
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
                title: "Edit my personal informations".tr(),
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kEditProfileView);
                }),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ButtonAuth(title: "Change my password".tr(), onTap: () {}),
          )
        ],
      ),
    );
  }
}
