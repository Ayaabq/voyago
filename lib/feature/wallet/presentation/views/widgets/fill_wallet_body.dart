import 'package:flutter/material.dart';
import 'package:voyago/constants.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/utils/validator_manager.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/profile/presentation/views/widgets/appbar_profile.dart';
import 'package:voyago/feature/profile/presentation/views/widgets/profile_textfield.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/widgets/dialog/dialog_void.dart';

class FillWalletBody extends StatelessWidget {
  const FillWalletBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //  mainAxisAlignment: MainAxisAlignment.start
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileAppBar(titel: "Fill in my wallet"),
          const SizedBox(height: 40),
          const FillCard(),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter the amount you want to add:",
                  style: Styles.textStyle16W400
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                TextFieldProfile(
                    hint: "",
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        ValidatorManager().validateWallet(value)),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      "Upload the bank deposit picture:",
                      style: Styles.textStyle16W400
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.kMove[5],
                        foregroundColor: CustomColors.kWhite[0],
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Icon(Icons.file_upload_outlined),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: ScreenSizeUtil.screenHeight * 0.3),
          Padding(
            padding: kPaddingHoriz24,
            child: ButtonAuth(
                title: "Submit",
                onTap: () {
                  showWatingDialog(context);
                }),
          )
        ],
      ),
    );
  }
}

class FillCard extends StatelessWidget {
  const FillCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 90,
      ),
      child: Card(
        elevation: 4,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(16),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Center(
            child: Image.asset(
              Wallet.fillWalletImage,
              width: 125,
              height: 120,
            ),
          ),
        ),
      ),
    );
  }
}
