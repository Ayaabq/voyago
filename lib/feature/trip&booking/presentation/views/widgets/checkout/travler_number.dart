import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/checkout_cubit/checkout_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/checkout_cubit/checkout_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/count_widget.dart';

import '../../../../../../core/utils/styles.dart';

class TravelerNumber extends StatelessWidget {
  const TravelerNumber({super.key, required this.max});
  final int max;
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CheckoutCubit,CheckoutState>(
        builder: (context, state){

        return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
             Text(
              "You can select unlimited travelers in total.".tr(),
              style: Styles.textStyle13W400,
            ),
            const SizedBox(height: 12.0),
            ItemCountWidget(
              title: "Adult (age 18-95)".tr(),
              initialCount: context.read<CheckoutCubit>().adults??0,
              onPressed: context.read<CheckoutCubit>().updateAdults,
              max: max,
            ),
            const SizedBox(height: 12.0),
            ItemCountWidget(
              title: "Child (age 5 - 17)".tr(),
              initialCount: context.read<CheckoutCubit>().child??0,
              onPressed: context.read<CheckoutCubit>().updateChild,
              max: max,
            ),
            // Add your optional choices widgets here
          ],
        );

    });
  }
}

