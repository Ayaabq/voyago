import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_rate.dart';
import 'package:voyago/feature/home/presentation/views/widgets/offers/offer_card.dart';

class CustomHomeList extends StatelessWidget {
  const CustomHomeList(
      {super.key, required this.title, required this.sizedList});
  final String title;
  final Widget sizedList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: Styles.textStyle20W700.copyWith(
            color: CustomColors.kMove[8],
          ),
        ),

        const SizedBox(
          width: double.infinity,
          height: 10,
        ),
        sizedList,
        const SizedBox(
          width: double.infinity,
          height: 5,
        ),
      ],
    );
  }
}
