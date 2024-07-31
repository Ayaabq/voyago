import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/profile/presentation/manager/currency_cubit/currency_cubit.dart';

class TextCostDetail extends StatelessWidget {
  final int child;
  final double childPrice;
  final double adultPrice;
  final int  adult;

  const TextCostDetail({super.key, required this.child, required this.adult, required this.childPrice, required this.adultPrice});

  @override
  Widget build(BuildContext context) {
    final exchanger= context.read<CurrencyCubit>().exchanger;
    String currency= context.read<CurrencyCubit>().selectedCurrency;
    if(currency=="USD") {
      currency='\$';
    } else if(currency=="EUR") currency='€';
    return Column(
      children: [
        Text(
          '$currency ${childPrice*exchanger} x $child Child(s)',
          style: const TextStyle(

            fontSize: 16,
          ),
        ),
        Text(
          '$currency ${adultPrice* exchanger} x $adult Adult(s)',
          style: const TextStyle(

            fontSize: 16,
          ),
        ),

      ],
    );
  }
}
