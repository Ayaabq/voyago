import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/core/data/models/destination_model.dart';
import 'package:voyago/feature/core/presentation/manager/favotire_destination_cubit/favorite_destination_cubit.dart';
import 'package:voyago/feature/core/presentation/manager/favotire_destination_cubit/favorite_destination_state.dart';
import 'package:voyago/core/widgets/toast/toast_extensions.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/widgets/favorite_icon_button.dart';

class DestinationBackground extends StatelessWidget {
  const DestinationBackground({super.key, this.destinationModel});
  final DestinationModel? destinationModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeFavoriteDestinationCubit,
        ChangeDestinationFavoriteState>(
      builder: (ctx, state) {
        // if(state is ChangeDestinationFavoriteInitial)
        //   return

        return Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              HomeAssets.dummyDestination,
              fit: BoxFit.cover,

              // This ensures the image covers the entire area
            ),
            Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(140, 0, 0, 0),
                      Color.fromARGB(0, 1, 1, 1),
                    ],
                    stops: [0.0, 0.8],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  (destinationModel?.name) ?? "paris",
                  style: Styles.textStyle18W700
                      .copyWith(color: CustomColors.kWhite[0]),
                ),
              ),
            ),
            Positioned(
              top: 11,
              right: 16,
              child: FavoriteButton(
                onPressed: () {
                  print("aya");
                  print(destinationModel);
                  context
                      .read<ChangeFavoriteDestinationCubit>()
                      .addTrendingDestination2Favourite(destinationModel!);
                },
                isFavorite: (destinationModel?.isFavourite) ?? true,
              ),
            ),
          ],
        );
      },
      listener: (BuildContext context, ChangeDestinationFavoriteState state) {
        // if (state is ChangeDestinationFavoriteLoading) {
        //   context.showLoadingToast();
        // } else if (state is ChangeDestinationFavouriteSuccess) {
        //   context.showSuccessToast(state.message);
        // } else
          if (state is ChangeDestinationFavouriteFailure) {
          print(state.errorMessage);
          context.showFailureToast(state.errorMessage);
        } else {
          print("eror404");
        }
      },
    );
  }
}
