
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_sliver_app_bar.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';
import 'package:voyago/generated/assets.dart';

import 'appbar_profile.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SilverAppBarCustom(
        background: DetilesHederProfile(),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              SettingItem(
                icon: Iconsax.profile_circle,
                title: 'My personal information',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kPersonalInformationView);
                },
              ),
              Divider(
                color: CustomColors.kGrey[0],
              ),
              SettingItem(
                icon: Iconsax.wallet_24,
                title: 'My wallet',
                onTap: () {
                  // Handle tap
                },
              ),
              Divider(
                color: CustomColors.kGrey[0],
              ),
              SettingItem(
                icon: Iconsax.star,
                title: 'My reviews',
                onTap: () {
                  // Handle tap
                },
              ),
              Divider(
                color: CustomColors.kGrey[0],
              ),
              SettingItem(
                icon: Iconsax.setting_2,
                title: 'App settings',
                onTap: () {
                  // Handle tap
                },
              ),
              Divider(
                color: CustomColors.kGrey[0],
              ),
              SettingItem(
                icon: Iconsax.message_question,
                title: 'Help and support',
                onTap: () {
                  // Handle tap
                },
              ),
              Divider(
                color: CustomColors.kGrey[0],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonAuth(title: "Delete my account", onTap: () {}),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonAuth(title: "Log Out", onTap: () {}),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}

class DetilesHederProfile extends StatelessWidget {
  const DetilesHederProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        const ProfilePicture(),
        const SizedBox(height: 6),
        Text(
          "Hi, Aya Almalla",
          style: Styles.textStyle20W700.copyWith(
              fontWeight: FontWeight.w600, color: CustomColors.kWhite[0]),
        ),
        const SizedBox(height: 4),
        Text(
          "ayahalmalla@gmail.com",
          style: Styles.textStyle13W400.copyWith(color: CustomColors.kWhite[0]),
        ),
      ],
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: CustomColors.kMove[6]),
      title: Text(
        title,
        style: Styles.textStyle16W400.copyWith(fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.keyboard_arrow_right_rounded,
          color: CustomColors.kMove[6]),
      onTap: onTap,
    );
  }
}

class SilverAppBarCustom extends StatelessWidget {
  const SilverAppBarCustom({
    super.key,
    required this.background,
  });
  final Widget background;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 220,
      backgroundColor: CustomColors.kMove[5],
      floating: false,
      pinned: true,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: background,
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Center(
          child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(Assets.homeDummyOffer),
          ),
        ),
        // Positioned(
        //   bottom: 80,
        //   right: 140,
        //   child: CircleAvatar(
        //     backgroundColor: Colors.purple,
        //     radius: 16,
        //     child: Icon(
        //       Icons.edit,
        //       color: Colors.white,
        //       size: 16,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

