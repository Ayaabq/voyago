import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      this.title,
      required this.content,
      this.onTap,
      this.titleStyle});
  final String? title;
  final Widget content;
  final TextStyle? titleStyle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Increase the radius here
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  20), // Ensure the inner decoration matches
              color: CustomColors.kWhite[5]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title!,
                        style: titleStyle ?? Styles.textStyle20W700,
                      ),
                      if (onTap != null)
                        TextButton(
                          onPressed: onTap,
                          child: Row(
                            children: [
                               Text(
                                'View all'.tr(),
                                style: TextStyle(
                                  color: CustomColors.kHighlightMove,
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                    ],
                  ),
                const SizedBox(height: 5),
                content,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
