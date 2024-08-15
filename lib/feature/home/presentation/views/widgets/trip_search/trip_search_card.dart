import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/core/utils/services_locater.dart';
import 'package:voyago/feature/favorite/presentation/views/widgets/favorite_icon_button.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/widgets/search_trip_image.dart';
import 'package:voyago/feature/images/data/repo/images_repo.dart';
import 'package:voyago/feature/images/data/repo/images_repo_impl.dart';
import 'package:voyago/feature/images/presentation/manager/images_cubit.dart';
import 'package:voyago/feature/search/data/models/search_trip_model.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_model.dart';

class TripSearchCard extends StatelessWidget {
  const TripSearchCard({super.key,  required this.trip});
  final TripSearchModel trip;
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return Flexible(
      child: InkWell(
        onTap:   (){
          GoRouter.of(context)
              .push(AppRouter.kTripDetailsView, extra: TripModel(id: trip.id, name: trip.name, image: "image", isFavourite: trip.favorites, rate: 10.0, price: trip.tripPrice, destination: trip.destination.name, duration: 1));
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Stack(
            children: [
              Card(
                elevation: 4,
                child: 
                BlocProvider(create: (BuildContext context) =>ImageCubit(getIt.get<ImagesRepoImpl>()),
                  child: SearchTripImage(trip: trip,
                  ),
                  
                ),
              ),
              const Align(
                  alignment:AlignmentDirectional.topEnd,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 14),

                    child: FavoriteButton(),
                  )),
            ],
          ),

        ),
      ),
    );
  }
}

