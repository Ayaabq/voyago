import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';

class HiglightText extends StatelessWidget {
  const HiglightText({super.key, required this.text});
  final Widget text;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: CustomColors.kMove[2],
        borderRadius: BorderRadius.circular(20),
      ),
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0, ),
          child: text,
        )

    );
  }
}
