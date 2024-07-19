import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/widgets/custom_card.dart';

import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({super.key, required this.timeCancel});
  final int timeCancel;
  @override
  Widget build(BuildContext context) {
    return  CustomCard(title: "Some notes",
        content: BulletedList(
          bulletColor: CustomColors.kBlack[2],
          listItems:  [
            Text(
              "For a full refund, you must cancel at least $timeCancel  days after your reservation submitter.",
              style: Styles.textStyle14W400,
            ),
            const Text(
              "This trip requires a minimum number of travelers. If it’s canceled because the minimum isn’t met, you’ll be offered a different date/trip or a full refund.",
              style: Styles.textStyle14W400,
            ),

          ],
          bulletType: BulletType.conventional,
        )
    );
  }
}
