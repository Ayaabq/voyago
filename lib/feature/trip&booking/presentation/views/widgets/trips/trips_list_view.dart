import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trips_cubit/trips_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trips_cubit/trips_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/trips/trip_card.dart';

import '../../../../../../core/utils/screen_size_util.dart';
import '../../../../../../core/widgets/custom_failure_error.dart';
import '../../../../../../core/widgets/shimmer/load_List.dart';
import '../../../../data/models/trip_model.dart';

class TripsListView extends StatelessWidget {
  const TripsListView({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    context.read<TripsCubit>().fetchTripsInitial(url);

    ScreenSizeUtil.init(context);
    return BlocBuilder<TripsCubit, TripsState>(
      builder: (ctx,state){
        if(state is TripsSuccess){
          List<TripModel> trips=state.tripModels;
          return SizedBox(
            height: 200,
            child: ListView.builder(

              scrollDirection: Axis.horizontal,
              itemCount: trips.length,
              itemBuilder: (context, index) {
                return  Row(
                  children: [
                    InkWell(

                        child:  TripCard(tripModel:  trips[index],),
                        onTap: (){
                          GoRouter.of(context).push(AppRouter.kTripDetailsView);

                        }

                    ),
                    const SizedBox(width: 3,)
                  ],
                );
              },
            ),
          );
        }else if (state is TripsFailure)
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
  }
}

