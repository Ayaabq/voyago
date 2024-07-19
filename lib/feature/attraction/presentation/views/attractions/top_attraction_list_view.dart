import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/attraction/data/models/attraction_model.dart';
import 'package:voyago/feature/attraction/presentation/manager/attraction_state.dart';
import 'package:voyago/feature/attraction/presentation/manager/attractoin_cubit.dart';
import 'package:voyago/feature/attraction/presentation/views/attractions/attraction_card.dart';

import '../../../../../core/widgets/custom_failure_error.dart';
import '../../../../../core/widgets/shimmer/load_List.dart';

class AttractionListView extends StatelessWidget {
  const AttractionListView({super.key,  this.url, this.attractions});
  final String? url;
  final List<AttractionModel>? attractions;
  @override
  Widget build(BuildContext context) {

    if(attractions ==null) {
      context.read<AttractionCubit>().fetchAttractionInitial(url!);
      return BlocBuilder<AttractionCubit, AttractionState>(
        builder: (ctx,state){
          if(state is AttractionSuccess){
            List<AttractionModel> attractions=state.attractionModel;
            return SizedBox(
              height: 180,
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: attractions.length,
                itemBuilder: (context, index) {
                  return  Row(
                    children: [
                      AttractionCard(attractionModel: attractions[index],),
                      SizedBox(width: 3,)
                    ],
                  );
                },
              ),
            );
          }else if (state is AttractionFailure)
          {
            return CustomFailureError(errMessage: state.errorMessage);
          }else
          {
            return SizedBox(
              height: 180,


              child: const LoadList(
                isVertical: false,
              ),
            );
          }
        },
      );

    }
    return SizedBox(
      height: 180,
      child: ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: attractions!.length,
        itemBuilder: (context, index) {
          return  Row(
            children: [
              AttractionCard(attractionModel: attractions![index],),
              SizedBox(width: 3,)
            ],
          );
        },
      ),
    );

  }
}
