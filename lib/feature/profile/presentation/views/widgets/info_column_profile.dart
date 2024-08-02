import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/feature/profile/presentation/views/widgets/info_user.dart';

import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../../../../core/widgets/dialog/dialog_void.dart';
import '../../manager/profile/info_profile/info_profile_cubit.dart';
import '../../manager/profile/info_profile/info_profile_state.dart';

class InfoColumn extends StatelessWidget {
  const InfoColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().fetchUser();
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is UserSuccess) {
        return Column(
          children: [
            InformationRow(
              icon: Iconsax.user,
              label: 'User name'.tr(),
              value: " ${state.user.username}",
            ),
            Divider(
              color: CustomColors.kGrey[0],
            ),
            InformationRow(
              icon: Icons.email_outlined,
              label: 'Email'.tr(),
              value: state.user.email,
            ),
            Divider(
              color: CustomColors.kGrey[0],
            ),
            InformationRow(
              icon: Icons.phone,
              label: 'Phone Number'.tr(),
              value: state.user.phone ?? "",
            ),
            Divider(
              color: CustomColors.kGrey[0],
            ),
            InformationRow(
              icon: Icons.location_on,
              label: 'Hometown'.tr(),
              value: state.user.location ?? "",
            ),
            Divider(
              color: CustomColors.kGrey[0],
            ),
            SizedBox(
              height: ScreenSizeUtil.screenHeight * 0.15,
            ),
          ],
        );
      } else if (state is UserFailure) {
        showFailureDialog(context);
        return const Center(child: Text("Try agin"));
      } else if (state is UserLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return const Center(child: Text("opse"));
    });
  }
}
