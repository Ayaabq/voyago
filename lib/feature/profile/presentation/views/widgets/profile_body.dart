import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/widgets/custom_sliver_app_bar.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';
import 'package:voyago/generated/assets.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SilverAppBarCustom(
        background: ProfilePicture(),
//DetilsHomeAppBar(),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              SettingItem(
                icon: Iconsax.user,
                title: 'My personal information',
                onTap: () {
                  // Handle tap
                },
              ),
              Divider(
                color: CustomColors.kGrey[1],
              ),
              SettingItem(
                icon: Icons.account_balance_wallet_outlined,
                title: 'My wallet',
                onTap: () {
                  // Handle tap
                },
              ),
              Divider(
                color: CustomColors.kGrey[1],
              ),
              SettingItem(
                icon: Icons.star_outline,
                title: 'My reviews',
                onTap: () {
                  // Handle tap
                },
              ),
              Divider(
                color: CustomColors.kGrey[1],
              ),
              SettingItem(
                icon: Icons.settings_outlined,
                title: 'App settings',
                onTap: () {
                  // Handle tap
                },
              ),
              Divider(
                color: CustomColors.kGrey[1],
              ),
              SettingItem(
                icon: Icons.help_outline,
                title: 'Help and support',
                onTap: () {
                  // Handle tap
                },
              ),
              Divider(
                color: CustomColors.kGrey[1],
              ),
              const SizedBox(height: 20),
              ButtonAuth(title: "log out", onTap: () {}),
              const SizedBox(height: 16),
              ButtonAuth(title: "log out", onTap: () {}),
            ],
          ),
        ),
      )
    ]);
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const ListItemm(),
    );
  }
}

class ListItemm extends StatelessWidget {
  const ListItemm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SettingItem(
          icon: Icons.person_outline,
          title: 'My personal information',
          onTap: () {
            // Handle tap
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        SettingItem(
          icon: Icons.account_balance_wallet_outlined,
          title: 'My wallet',
          onTap: () {
            // Handle tap
          },
        ),
        SettingItem(
          icon: Icons.star_outline,
          title: 'My reviews',
          onTap: () {
            // Handle tap
          },
        ),
        SettingItem(
          icon: Icons.settings_outlined,
          title: 'App settings',
          onTap: () {
            // Handle tap
          },
        ),
        SettingItem(
          icon: Icons.help_outline,
          title: 'Help and support',
          onTap: () {
            // Handle tap
          },
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
      title: Text(title),
      trailing: Icon(Icons.chevron_right, color: CustomColors.kMove[6]),
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

      // title: const TitleRow(),
      flexibleSpace: FlexibleSpaceBar(
        background: background,
        // DetilsHomeAppBar(),
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
            // يمكنك استبدال الرابط بصورة حقيقية
          ),
        ),
        Positioned(
          bottom: 80,
          right: 140,
          child: CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 16,
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}
