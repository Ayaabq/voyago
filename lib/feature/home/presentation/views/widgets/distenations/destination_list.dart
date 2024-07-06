import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/widgets/shimmer/load_List.dart';
import 'package:voyago/feature/home/data/models/destination_model.dart';
import 'package:voyago/feature/home/presentation/maneger/trending_destination_state.dart';
import 'package:voyago/feature/home/presentation/maneger/trinding_destination_cubit.dart';
import 'package:voyago/feature/home/presentation/views/widgets/distenations/destination_item.dart';

import '../../../../../../core/widgets/custom_failure_error.dart';



class DestinationListView extends StatelessWidget {
  const DestinationListView({super.key});

  @override

  @override
  Widget build(BuildContext context) {
    context.read<TrendingDestinationCubit>().fetchTrendingDestinationInitial();

    return BlocBuilder<TrendingDestinationCubit, TrendingDestinationState>(
      builder: (ctx,state){
        if(state is TrendingDestinationSuccess){
          List<DestinationModel> destinations=state.destinationModels;
          return SizedBox(
            height: 140,
            child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: (context, index) {
                  return  Row(
                    children: [
                      InkWell(

                          child: DestinationItem(
                            destinationModel: destinations[index] ,),
                        onTap: (){}

                      ),
                      SizedBox(width: 5,)
                    ],
                  );
                },
              ),
          );
        }else if (state is TrendingDestinationFailure)
        {
          return CustomFailureError(errMessage: state.errorMessage);
        }else
        {
          return SizedBox(
            height: 140,


            child: const LoadList(
                  isVertical: false,
                ),
          );
        }
      },
    );

    //   SizedBox(
    //   height: 140,
    //   child:
    //   // LoadList(
    //   //   isVertical: false,
    //   // ),
    //   // ListView.builder(
    //   //
    //   //   scrollDirection: Axis.horizontal,
    //   //   itemCount: 10,
    //   //   itemBuilder: (context, index) {
    //   //     return  Row(
    //   //       children: [
    //   //         InkWell(
    //   //
    //   //             child: DestinationItem(),
    //   //           onTap: (){
    //   //               context.read<TrendingDestinationCubit>().fetchTrendingDestinationInitial();
    //   //           },
    //   //         ),
    //   //         SizedBox(width: 5,)
    //   //       ],
    //   //     );
    //   //   },
    //   // ),
    // );
  }
}
