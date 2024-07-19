import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/widgets/shimmer/load_List.dart';


import '../../../../../../core/widgets/custom_failure_error.dart';
import '../../../../data/models/destination_model.dart';
import '../../../manager/destination_cubit/destination_cubit.dart';
import '../../../manager/destination_cubit/destination_state.dart';
import 'destination_item.dart';



class DestinationListView extends StatelessWidget {
  const DestinationListView({super.key, required this.url});
  final String url;
  @override

  @override
  Widget build(BuildContext context) {

    context.read<DestinationCubit>().fetchDestinationInitial(url);

    return BlocBuilder<DestinationCubit, DestinationState>(
      builder: (ctx,state){
        if(state is DestinationSuccess){
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
                        onTap: (){
                          GoRouter.of(context).push(AppRouter.kDestinationDetailsView);
                        }

                      ),
                      const SizedBox(width: 5,)
                    ],
                  );
                },
              ),
          );
        }else if (state is DestinationFailure)
        {
          return CustomFailureError(errMessage: state.errorMessage);
        }else
        {
          return const SizedBox(
            height: 140,


            child: LoadList(
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
