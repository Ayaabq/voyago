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
              color: Theme.of(context).cardColor),
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
                        style: Theme.of(context).brightness == Brightness.dark
                            ? titleStyle ?? Styles.textStyle20W700blak
                            : titleStyle ?? Styles.textStyle20W700,
                      ),
                      if (onTap != null)
                        TextButton(
                          onPressed: onTap,
                          child: const Text(
                            'View all> ',
                            style: TextStyle(
                              color: CustomColors.kHighlightMove,
                            ),
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
