import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_info_2_cubit/trip_info_2_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_info_2_cubit/trip_info_2_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/optinal_choices_list.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/optional_choice_item.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/rules_section.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/travler_number.dart';

import '../../../../../../core/widgets/custom_card.dart';

class Step1Page extends StatelessWidget {
  final int id;
  const Step1Page({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final trip = context.read<TripInfo2Cubit>().tripInfo2Model!;

    return ListView(
      children: [
        CustomCard(
          content: TravelerNumber(
            max: trip.available,
          ),
          title: "Number of travelers".tr(),
        ),
        CustomCard(
          title: "Optional choices".tr(),
          content: OptionalChoicesList(id: id,  max: trip.available,),
        ),
         CustomCard(content: RulesSection(timeCancel:trip.timeCancellation,)),
        const SizedBox(
          height: 70,
        )
      ],
    );
  }
}
