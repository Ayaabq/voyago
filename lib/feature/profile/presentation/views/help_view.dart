import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/profile/presentation/views/widgets/appbar_profile.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           ProfileAppBar(titel: "Help and support".tr()),
          const SizedBox(height: 26),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
                maxLines: 3,
                style: Styles.textStyle16W400
                    .copyWith(fontWeight: FontWeight.w500),
                "If you have any questions or problems you can contact our support team via the provided email".tr()),
          ),
          Padding(
            padding: const EdgeInsets.all(19),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: CustomColors.kGrey[0]),
              child: Text(
                "Voyago@gmail.com",
                style: Styles.textStyle16W400
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
