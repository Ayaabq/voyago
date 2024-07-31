import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';import 'package:voyago/core/utils/styles.dart';

import '../../../../../profile/presentation/manager/currency_cubit/currency_cubit.dart';
import 'higlight_text.dart';


class IconText extends StatelessWidget {
  const IconText({super.key, required this.icon, required this.title, this.isLast=false, this.higlightedText, this.price, this.iconColor, this.textStyle, this.iconSize});
  final IconData icon;
  final String title;
  final bool isLast;
  final String? higlightedText;
  final double? price;
  final Color? iconColor;
  final TextStyle? textStyle;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    final exchanger= context.read<CurrencyCubit>().exchanger;
    String currency= context.read<CurrencyCubit>().selectedCurrency;
    if(currency=="USD") {
      currency='\$';
    } else if(currency=="EUR") currency='€';
    return Column(
      children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Row(
              children: [
                Icon(icon,
                size: iconSize,
                color: iconColor,),
                const SizedBox(width: 3,),
                Text(" $title",
                overflow: TextOverflow.visible,
                maxLines: 10,
                style: textStyle??Styles.textStyle14W400,),
                if(price!=null)
                  Text("${price!*exchanger} $currency",
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
