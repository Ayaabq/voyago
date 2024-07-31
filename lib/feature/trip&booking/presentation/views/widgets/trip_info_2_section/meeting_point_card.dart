import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_card.dart';

class MeetingPointCard extends StatelessWidget {
  const MeetingPointCard({super.key, required this.details});
    final String details;
  @override
  Widget build(BuildContext context) {
    return  CustomCard(
      title: "Meeting Point".tr(),
      content: Text(
        details,
        style: Styles.textStyle14W400,
      ),
    );
  }
}
