import 'package:bulleted_list/bulleted_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_card.dart';

import '../../../../../../core/utils/custom_colors.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: "Description".tr(),
      content: BulletedList(
        bulletColor: CustomColors.kBlack[2],
        listItems: [
          Text(
            description,
            style: Styles.textStyle14W400,
          ),
        ],
        bulletType: BulletType.conventional,
      ),
    );
  }
}
