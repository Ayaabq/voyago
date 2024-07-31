import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';

import '../../feature/profile/presentation/manager/currency_cubit/currency_cubit.dart';

class DaysAndPriceWidget extends StatelessWidget {
  final int days;
  final double fromPrice;

  const DaysAndPriceWidget({
    super.key,
    required this.days,
    required this.fromPrice,
  });

  @override
  Widget build(BuildContext context) {
    final exchanger= context.read<CurrencyCubit>().exchanger;
    String currency= context.read<CurrencyCubit>().selectedCurrency;
    if(currency=="USD") {
      currency='\$';
    } else if(currency=="EUR") currency='€';
    return Row(
      children: [
        Text(
          "$days Days",
          style: Styles.textStyle12W400
        ),
        const Spacer(),
        // Spacing between the text and the container
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: CustomColors.kGrey[0], // Background color of the container
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            "form ${fromPrice*exchanger} $currency",
            style: Styles.textStyle10W400
          ),
        ),
      ],
    );
  }
}
