import 'package:flutter/material.dart';import 'package:voyago/core/utils/styles.dart';

import 'higlight_text.dart';


class IconText extends StatelessWidget {
  const IconText({super.key, required this.icon, required this.title, this.isLast=false, this.higlightedText});
  final IconData icon;
  final String title;
  final bool isLast;
  final String? higlightedText;
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
                Text(title,
                style: Styles.textStyle13W400,),

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
