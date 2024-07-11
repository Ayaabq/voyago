import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../auth/login/presentation/views/widgets/button_auth.dart';
import 'appbar_profile.dart';
import 'edit_image_prof.dart';
import 'info_user.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[ Column(
          children: [
            const ProfileAppBar(
              titel: 'Edit Personal Information',
            ),
            const SizedBox(height: 30),
            const ProfilePictureEdit(),
            const SizedBox(height: 30),
            const InformationEdit(
              icon: Iconsax.user,
              label: 'User name',
              value: 'Ayalmalla',
            ),
            const InformationEdit(
              icon: Icons.email_outlined,
              label: 'Email',
              value: 'ayalmallah@gmail.com',
            ),
            const InformationEdit(
              icon: Icons.phone,
              label: 'Phone Number',
              value: '0964682070',
            ),
            const InformationEdit(
              icon: Icons.location_on,
              label: 'Hometown',
              value: 'Damascus, Syria',
            ),
            SizedBox(
              height: ScreenSizeUtil.screenHeight * 0.15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ButtonAuth(
                  title: "Edit",
                  onTap: () {
                    //   GoRouter.of(context).push(AppRouter.kEditProfileView);
                  }),
            ),
            const SizedBox(height: 10),
          ],
        ),
     ] ),
    );
  }
}


class InformationEdit extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InformationEdit({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: CustomColors.kMove[5]),
              const SizedBox(width: 10),
              Text(
                label,
                style: Styles.textStyle16W700.copyWith(
                    fontWeight: FontWeight.w600, color: CustomColors.kBlack[1]),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
              padding: const EdgeInsets.only(left: 32),
              child:
 //Text(value)
TextFormField(
             ),
),
            //  ),

        ],
      ),
    );
  }
}
