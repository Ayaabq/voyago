import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/widgets/custom_failure_error.dart';
import 'package:voyago/core/widgets/shimmer/load_base.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/optional_choices_cubit/optional_choices_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/optional_choices_cubit/optional_choices_state.dart';
import '../../../../../../core/utils/styles.dart';
import 'optional_choice_item.dart';

class OptionalChoicesList extends StatelessWidget {
  const OptionalChoicesList({super.key, required this.id, required this.max});
  final int id;
  final int max;
  @override
  Widget build(BuildContext context) {
    context.read<OptionalEventsCubit>().fetchEventsInitial(id);
    return  BlocBuilder<OptionalEventsCubit,OptionalEventState>(
        builder: (context,state){
      if(state is OptionalEventSuccess){
        final events= state.events;
        return Column(
          children: [
            const Text(
              'Here you can choose optional events from the itinerary',
              style: Styles.textStyle13W400,
            ),
            ListView.builder(
              itemBuilder: (context, index){
                return  OptionalChoiceItem(eventModel: events[index], max: max,);
              },
              itemCount: events.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
          ],
        );
      }
      else if(state is OptionalEventFailure){
        return CustomFailureError(errMessage: state.errorMessage);
      }else{
        return LoadBase(
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70)
            ),
          ),
        );
      }
    });
  }
}
