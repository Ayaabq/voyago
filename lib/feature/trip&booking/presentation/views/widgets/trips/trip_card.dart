import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/core/widgets/toast/toast_extensions.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/trips/trip_details_column.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/confg.dart';
import '../../../../../favorite/presentation/manager/change_favorite_cubit/favorite_cubit.dart';
import '../../../../../favorite/presentation/manager/change_favorite_cubit/favorite_state.dart';
import '../../../../../favorite/presentation/views/favorite_icon_button.dart';
import '../../../../data/models/trip_model.dart';

class TripCard extends StatelessWidget {
  const TripCard({super.key, required this.tripModel});
  final TripModel tripModel;
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    ScreenSizeUtil.init(context);

    return BlocConsumer<ChangeFavoriteCubit, ChangeFavoriteState>(
      builder: (ctx, state) {
        return InkWell(
          onTap: (){
            GoRouter.of(context).push(AppRouter.kTripDetailsView,
                extra: tripModel);


          },
          child: Card(
            elevation: 4,
            child: Container(
              // Use a fraction of the screen width and height instead of fixed values
              width: ScreenSizeUtil.screenWidth * 0.4,
              // height: ScreenSizeUtil.screenHeight  * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 8,
                    right: 8,
                    left: 8,
                    bottom: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        HomeAssets.dummyTrip,
                        // Use a fraction of the container width and height instead of fixed values
                        width: ScreenSizeUtil.screenWidth * 0.4 * 0.8,
                        height: ScreenSizeUtil.screenHeight * 0.3 * 0.7,
                        fit: BoxFit
                            .cover, // This ensures the image covers the entire area
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color.fromARGB(0, 255, 255, 255),
                          Colors.white,
                        ],
                        stops: [
                          0.0,
                          0.6,
                          0.65,
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment:AlignmentDirectional.topEnd,

                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FavoriteButton(
                          onPressed: () {
                            context.read<ChangeFavoriteCubit>().addIDItem2Favourite(
                                tripModel.id, Confg.addTripFavouriteUrl,
                                tripModel: tripModel);
                          },
                          isFavorite: (tripModel.isFavourite) ?? true),
                    ),
                  ),
                  Positioned(
                    top: 125,
                    // right: 15,
                    left: 10,
                    right: 10,
                    child: TripDetailsColumn(
                      tripModel: tripModel,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, ChangeFavoriteState state) {
        final cubit = context.read<ChangeFavoriteCubit>();
        if (state is ChangeFavouriteFailure && !cubit.hasShownFailureToast) {
          context.showFailureToast(state.errorMessage);
          cubit.hasShownFailureToast =
              true; // Set the flag after showing the toast
        } else if (state is ChangeFavouriteSuccess) {
          cubit.resetFailureToastFlag(); // Reset the flag on success
        }
      },
    );
  }
}
