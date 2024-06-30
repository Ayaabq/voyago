import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/widgets/custom_card.dart';

import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/styles.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomCard(title: "Some notes",
        content: BulletedList(
          bulletColor: CustomColors.kBlack[2],
          listItems: const [
            Text(
              "Take a tour in Berlin with beautiful cruise ship dock ",
              style: Styles.textStyle14W400,
            ),
            Text(
              "Explore Germany’s capital and learn about its vibrant history",
              style: Styles.textStyle14W400,
            ),
            Text(
              "See landmarks like Checkpoint Charlie and the Memorial to the Murdered Jews",
              style: Styles.textStyle14W400,
            ),
          ],
          bulletType: BulletType.conventional,
        )
    );
  }
}
