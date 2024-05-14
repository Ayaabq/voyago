import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/home/presentation/views/widgets/custom_card_background.dart';

class CustomHomeList extends StatelessWidget {
  const CustomHomeList({super.key, required this.title});
  final String title;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(title,
        textAlign: TextAlign.start,
        style:  Styles.textStyle20W700.copyWith(
          color: CustomColors.kMove[8],

        ),),
        const SizedBox(
          width: double.infinity,
          height: 10,
        ),
        SizedBox(
          height:  150,
          child: ListView.builder(
            // physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount:  10,
            itemBuilder: (context, index){

            return const CustomCardBackground()
            ;
          },),
        )
      ],
    );
  }
}
