import 'package:bulleted_list/bulleted_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/checkout_cubit/checkout_cubit.dart';

import '../../../../../../core/utils/custom_colors.dart';

class RulesSection extends StatefulWidget {
  const RulesSection({super.key, required this.timeCancel});
  final int timeCancel;
  @override
  _RulesSectionState createState() => _RulesSectionState();
}

class _RulesSectionState extends State<RulesSection> {
  void _toggleAgreement(bool? value) {
    setState(() {
      // _agree = value ?? false;
      context.read<CheckoutCubit>().agreeToCondition();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rules".tr(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(
          "read role".tr(),
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16.0),
        Text(
          "Cancellation".tr(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        BulletedList(
          bulletColor: CustomColors.kBlack[2],
          listItems: [
            Text(
              "${"Up to".tr()} ${widget.timeCancel} ${"days in advance.".tr()}",
              style: Styles.textStyle14W400,
            ),
            Text(
                style: Styles.textStyle14W400,
                "${"For a full refund, you must cancel at least".tr()} ${widget.timeCancel} ${"days before the trip's start time.".tr()}"),
            Text(
                style: Styles.textStyle14W400,
                "This trip requires a minimum number of travelers. ".tr()),
            Text(
                style: Styles.textStyle14W400,
                "If it’s canceled because the minimum isn’t met, you’ll be offered a different date/trip or a full refund."
                    .tr()),
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
            Checkbox(
              value: context.read<CheckoutCubit>().agree,
              onChanged: _toggleAgreement,
            ),
            Expanded(
              child: Text(
                "I read and agree and understand the rules".tr(),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
