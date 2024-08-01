import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/trip&booking/data/models/itinerary/event_model.dart';
import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../profile/presentation/manager/currency_cubit/currency_cubit.dart';
import '../../maneger/checkout_cubit/checkout_cubit.dart';
import '../../maneger/checkout_cubit/checkout_state.dart';
import 'count_widget.dart';

class OptionalChoiceItem extends StatefulWidget {
  const OptionalChoiceItem({super.key, required this.eventModel, required this.max});
  final EventModel eventModel;
  final int max;

  @override
  State<OptionalChoiceItem> createState() => _OptionalChoiceItemState();
}

class _OptionalChoiceItemState extends State<OptionalChoiceItem> {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        context.read<CheckoutCubit>().addOptionalChoice(widget.eventModel);
      } else {
        context.read<CheckoutCubit>().remOptionalChoice(widget.eventModel.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final exchanger= context.read<CurrencyCubit>().exchanger;
    String currency= context.read<CurrencyCubit>().selectedCurrency;
    if(currency=="USD") {
      currency='\$';
    } else if(currency=="EUR") currency='€';
    return BlocBuilder<CheckoutCubit, CheckoutState>(builder: (context, state) {
      int childNum()  {
        if (state is CheckoutLoaded) {
          for (var e in state.optionalChoices) {
            if (e.id == widget.eventModel.id) {
              return  e.child;
            }
          }
        }
        return 0;
      }

      int adultsNum() {
        if(state is CheckoutLoaded)
        {
          for (var e in state.optionalChoices) {
            if (e.id == widget.eventModel.id) {
              return e.adults;
            }
          }
        }
        return 0;
      }

      return Column(
        children: [
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.eventModel.title,
                style: Styles.textStyle18W400,
              ),
              IconButton(
                icon: Icon(
                  _isExpanded ? Icons.remove_circle_outline : Icons.add_circle_outline,
                  color: !_isExpanded ? CustomColors.kGrey[1] : CustomColors.kHighlightMove,
                ),
                onPressed: _toggleExpansion,
              ),
            ],
          ),
          if (_isExpanded)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${"Child Price:".tr()} ${((widget.eventModel.priceChild ?? 0) *exchanger).toStringAsFixed(1)} $currency",
                  style: Styles.textStyle14W400,
                ),
                Text(
                  "${"Adult Price:".tr()} ${((widget.eventModel.priceAdult ?? 0) *exchanger).toStringAsFixed(1)} $currency",
                  style: Styles.textStyle14W400,
                ),
              ],
            ),
          if (_isExpanded)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ItemCountWidget(
                    title:  "Child:".tr(),
                    initialCount: childNum(),
                    onAddTap: () {
                      context.read<CheckoutCubit>().addChildOptionalChoice(widget.eventModel.id, 1);
                    },
                    onMidTap: () {
                      context.read<CheckoutCubit>().addChildOptionalChoice(widget.eventModel.id, -1);
                    },
                    max: widget.max,
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: ItemCountWidget(
                    title: "Adults:".tr(),
                    initialCount: adultsNum(),
                    onAddTap: () {
                      context.read<CheckoutCubit>().addAdultOptionalChoice(widget.eventModel.id, 1);
                    },
                    onMidTap: () {
                      context.read<CheckoutCubit>().addAdultOptionalChoice(widget.eventModel.id, -1);
                    },
                    max: widget.max,
                  ),
                ),
              ],
            ),
        ],
      );
    });
  }
}
