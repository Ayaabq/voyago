import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/icons_text.dart';

class SearchBootmSheet extends StatelessWidget {
  const SearchBootmSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Text(""),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 140,
      decoration: BoxDecoration(
          color: CustomColors.kWhite[3],
          borderRadius: BorderRadius.circular(32)),
      child: IconsText(
          text: text,
          icon: icon,
          colorIcon: CustomColors.kMove[4],
          sizeIcon: 16,
          style: Styles.textStyle13W400),
    );
  }
}
