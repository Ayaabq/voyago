import 'package:flutter/material.dart';import 'package:voyago/core/utils/styles.dart';

import 'higlight_text.dart';


class IconText extends StatelessWidget {
  const IconText({super.key, required this.icon, required this.title, this.isLast=false, this.higlightedText, this.price});
  final IconData icon;
  final String title;
  final bool isLast;
  final String? higlightedText;
  final double? price;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Row(
              children: [
                Icon(icon),
                const SizedBox(width: 2,),
                Text(" $title",
                style: Styles.textStyle14W400,),
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
