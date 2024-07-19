import 'package:flutter/material.dart';import 'package:voyago/core/utils/styles.dart';

import 'higlight_text.dart';


class IconText extends StatelessWidget {
  const IconText({super.key, required this.icon, required this.title, this.isLast=false, this.higlightedText, this.price, this.iconColor, this.textStyle});
  final IconData icon;
  final String title;
  final bool isLast;
  final String? higlightedText;
  final double? price;
  final Color? iconColor;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Row(
              children: [
                Icon(icon,
                color: iconColor,),
                const SizedBox(width: 3,),
                Text(" $title",
                overflow: TextOverflow.visible,
                maxLines: 10,
                style: textStyle??Styles.textStyle14W400,),
                if(price!=null)
                  Text("$price \$",
                  style: Styles.textStyle14W600,)

              ],
                     ),
             if(higlightedText!=null)
               HiglightText(text: Text(higlightedText!))

           ],
         ),
       if(!isLast)
        const  Divider()
      ],
    );
  }
}
