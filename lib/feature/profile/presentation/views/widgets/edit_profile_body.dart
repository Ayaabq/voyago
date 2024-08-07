// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:voyago/core/utils/validator_manager.dart';
// import 'package:voyago/feature/profile/presentation/views/widgets/profile_textfield.dart';

// import '../../../../../core/utils/custom_colors.dart';
// import '../../../../../core/utils/screen_size_util.dart';
// import '../../../../../core/utils/styles.dart';
// import '../../../../auth/login/presentation/views/widgets/button_auth.dart';
// import 'appbar_profile.dart';
// import 'edit_image_prof.dart';

// class EditProfileBody extends StatelessWidget {
//   const EditProfileBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const ProfileAppBar(
//               titel: 'Edit Personal Information',
//             ),
//             const SizedBox(height: 30),
//             const ProfilePictureEdit(),
//             const SizedBox(height: 30),
//             InformationEdit(
//               icon: Iconsax.user,
//               label: 'User name',
//               value: 'Ayalmalla',
//               child: TextFieldProfile(
//                   hint: "",
//                   keyboardType: TextInputType.name,
//                   validator: (value) => ValidatorManager().validateName(value)),
//             ),
//             InformationEdit(
//               icon: Icons.email_outlined,
//               label: 'Email',
//               value: 'ayalmallah@gmail.com',
//               child: TextFieldProfile(
//                   hint: "",
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) =>
//                       ValidatorManager().validateEmail(value)),
//             ),
//             InformationEdit(
//               icon: Icons.phone,
//               label: 'Phone Number',
//               value: '0964682070',
//               child: TextFieldProfile(
//                   hint: "",
//                   keyboardType: TextInputType.number,
//                   validator: (value) =>
//                       ValidatorManager().validatePhone(value)),
//             ),
//             InformationEdit(
//               icon: Icons.location_on,
//               label: 'Hometown',
//               value: 'Damascus, Syria',
//               child: TextFieldProfile(
//                   hint: "",
//                   keyboardType: TextInputType.name,
//                   validator: (value) =>
//                       ValidatorManager().validateLocation(value)),
//             ),
//             SizedBox(
//               height: ScreenSizeUtil.screenHeight * 0.15,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: ButtonAuth(
//                   title: "Edit",
//                   onTap: () {
//                     //   GoRouter.of(context).push(AppRouter.kEditProfileView);
//                   }),
//             ),
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/feature/profile/data/models/user_model.dart';
import 'package:voyago/feature/profile/presentation/views/widgets/profile_textfield.dart';

import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/validator_manager.dart';
import '../../../../auth/login/presentation/views/widgets/button_auth.dart';
import '../../manager/profile/info_profile/info_profile_cubit.dart';
import 'appbar_profile.dart';
import 'edit_image_prof.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({
    super.key,
  });

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  @override
  Widget build(BuildContext context) {
//context.read<UserCubit>().fetchUser();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileAppBar(
              titel: "Edit Personal Information".tr(),
            ),
            const SizedBox(height: 30),
            const ProfilePictureEdit(),
            const SizedBox(height: 30),
            InformationEdit(
              icon: Iconsax.user,
              label: "User name".tr(),
              value: 'Ayalmalla',
              child: TextFieldProfile(
                  hint: "",

                  //widget.usermodel.username,
                  keyboardType: TextInputType.name,
                  validator: (value) => ValidatorManager().validateName(value)),
            ),
            // InformationEdit(
            //   icon: Icons.email_outlined,
            //   label: "Email".tr(),
            //   value: 'ayaalmallah@gmail.com',
            //   child: TextFieldProfile(
            //       hint: "",
            //       keyboardType: TextInputType.emailAddress,
            //       validator: (value) =>
            //           ValidatorManager().validateEmail(value)),
            // ),
            InformationEdit(
              icon: Icons.phone,
              label: "Phone Number".tr(),
              value: '0964682070',
              child: TextFieldProfile(
                  hint: "",
                  //    hint: widget.usermodel.phone ?? "",
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      ValidatorManager().validatePhone(value)),
            ),
            InformationEdit(
              icon: Icons.location_on,
              label: "Hometown".tr(),
              value: 'Damascus, Syria',
              child: TextFieldProfile(
                  hint: "",
                  //      hint: widget.usermodel.location ?? "",
                  keyboardType: TextInputType.name,
                  validator: (value) =>
                      ValidatorManager().validateLocation(value)),
            ),
            InformationEdit(
              icon: Icons.location_on,
              label: "old password",
              value: 'Damascus, Syria',
              child: TextFieldProfile(
                  hint: "",
                  keyboardType: TextInputType.name,
                  validator: (value) =>
                      ValidatorManager().validateLocation(value)),
            ),
            InformationEdit(
              icon: Icons.location_on,
              label: "new password",
              value: '',
              child: TextFieldProfile(
                  hint: "",
                  keyboardType: TextInputType.name,
                  validator: (value) =>
                      ValidatorManager().validateLocation(value)),
            ),
            InformationEdit(
              icon: Icons.location_on,
              label: "conf password",
              value: '',
              child: TextFieldProfile(
                  hint: "",
                  keyboardType: TextInputType.name,
                  validator: (value) =>
                      ValidatorManager().validateLocation(value)),
            ),
            SizedBox(
              height: ScreenSizeUtil.screenHeight * 0.15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ButtonAuth(
                  title: "Edit".tr(),
                  onTap: () {
                    //   GoRouter.of(context).push(AppRouter.kEditProfileView);
                  }),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class InformationEdit extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Widget? child;
  const InformationEdit({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.child,
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
              Text(label, style: Styles.textStyle16W600
// .copyWith(
//                     fontWeight: FontWeight.w600, color: CustomColors.kBlack[1]),
                  ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Padding(padding: const EdgeInsets.only(left: 0), child: child),
        ],
      ),
    );
  }
}

//8
