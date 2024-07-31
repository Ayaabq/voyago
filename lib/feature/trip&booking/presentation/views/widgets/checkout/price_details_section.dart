import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/checkout_cubit/checkout_cubit.dart';

import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/price_details_item.dart';
import '../../../../../../core/widgets/text_cost_details_item.dart';
import '../../../../../profile/presentation/manager/currency_cubit/currency_cubit.dart';

class PriceDetailsSection extends StatelessWidget {
  const PriceDetailsSection({super.key, required this.tripPrice});
  final double tripPrice;
  @override
  Widget build(BuildContext context) {
    final exchanger= context.read<CurrencyCubit>().exchanger;
    String currency= context.read<CurrencyCubit>().selectedCurrency;
    if(currency=="USD") {
      currency='\$';
    } else if(currency=="EUR") currency='€';
    final manager=context.read<CheckoutCubit>();
    final optional=manager.optionalChoices;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: CustomColors.kGrey[0]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

           Text(
            "Price details".tr(),
            style: Styles.textStyle16W700,
          ),
          const SizedBox(height: 16.0),
           PriceDetailItem(
              title: "Travelers".tr(),
              details: TextCostDetail(
                  child: manager.child??0,
                  adult: manager.adults!,
                  childPrice: tripPrice, adultPrice: tripPrice)
          ),
          Divider(
            color: CustomColors.kBlack[1],
            endIndent: 20,
            indent: 20,
          ),
           Text(
            "Optional choices".tr(),
            style:Styles.textStyle16W700,
          ),
          const SizedBox(height: 16.0),
          if(optional != null) ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: optional.length,
              itemBuilder: (context, index){
            return  PriceDetailItem(
                title: optional[index].title,
                details:
                TextCostDetail(
                    child: optional[index].child,
                    adult: optional[index].adults,
                    childPrice: optional[index].childPrice,
                    adultPrice: optional[index].adultPrice)

            );
          }),
          if(optional ==null || optional.isEmpty)
             Text("No Optional choices was selected".tr()),
          const SizedBox(height: 16.0),
          Divider(
            color: CustomColors.kBlack[1],
            endIndent: 20,
            indent: 20,
          ),
           Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                '$currency ${manager.getTotalPrice(tripPrice)*exchanger}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.kHighlightMove,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
