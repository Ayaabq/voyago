import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/core/widgets/toast/toast_extensions.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/trips/trip_details_column.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/confg.dart';
import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/services_locater.dart';
import '../../../../../favorite/presentation/manager/change_favorite_cubit/favorite_cubit.dart';
import '../../../../../favorite/presentation/manager/change_favorite_cubit/favorite_state.dart';
import '../../../../../favorite/presentation/views/widgets/favorite_icon_button.dart';
import '../../../../../images/data/repo/images_repo_impl.dart';
import '../../../../../images/presentation/manager/images_cubit.dart';
import '../../../../../images/presentation/views/custom)netowk_image.dart';
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
          onTap: () {
            GoRouter.of(context)
                .push(AppRouter.kTripDetailsView, extra: tripModel);
          },
          child: Card(
            elevation: 4,
            child: Container(
              // Use a fraction of the screen width and height instead of fixed values
              width: ScreenSizeUtil.screenWidth * 0.45,
              // height: ScreenSizeUtil.screenHeight  * 0.5,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
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
                      child:  BlocProvider(
                        key: Key("trip: ${tripModel.id}"),
                        create: (context) => ImageCubit(getIt.get<ImagesRepoImpl>()),
                        child: CustomNetworkImage(id: tripModel.id, url: Confg.tripImage,),

                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Theme.of(context).brightness == Brightness.dark
                              ? const Color.fromARGB(0, 83, 82, 82)
                              : const Color.fromARGB(0, 255, 255, 255),
                          Theme.of(context).brightness == Brightness.dark
                              ? Theme.of(context).cardColor
                              : CustomColors.kWhite[0],

                          // Colors.transparent,
                          // Color.fromARGB(0, 255, 255, 255),
                          // Colors.white,
                        ],
                        stops: const [
                          0.0,
                          0.6,
                          0.65,
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FavoriteButton(
                          onPressed: () {
                            context
                                .read<ChangeFavoriteCubit>()
                                .addIDItem2Favourite(
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
