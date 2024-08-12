import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/toast/toast_extensions.dart';
import 'package:voyago/feature/destination/presentation/views/widgets/distenations/destination_image.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/confg.dart';
import '../../../../../../core/utils/services_locater.dart';
import '../../../../../favorite/presentation/manager/change_favorite_cubit/favorite_cubit.dart';
import '../../../../../favorite/presentation/manager/change_favorite_cubit/favorite_state.dart';
import '../../../../../favorite/presentation/views/widgets/favorite_icon_button.dart';
import '../../../../../images/data/repo/images_repo_impl.dart';
import '../../../../../images/presentation/manager/images_cubit.dart';
import '../../../../data/models/destination_model.dart';

class DestinationBackground extends StatelessWidget {
  const DestinationBackground({super.key, this.destinationModel});
  final DestinationModel? destinationModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeFavoriteCubit,
        ChangeFavoriteState>(
      builder: (ctx, state) {
        return Stack(
          fit: StackFit.expand,
          children: [
            BlocProvider(
              create: (context) => ImageCubit(getIt.get<ImagesRepoImpl>()),
              child: DestinationImage(id: destinationModel!.id,),

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
              ),
            ),
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
            Align(

              alignment:AlignmentDirectional.topEnd,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                child: FavoriteButton(
                  onPressed: () {

                    context
                        .read<ChangeFavoriteCubit>()
                        .addIDItem2Favourite(destinationModel!.id,
                        Confg.addDestinationFavouriteUrl,
                    destinationModel: destinationModel);
                  },
                  isFavorite: (destinationModel?.isFavourite) ?? true,
                ),
              ),
            ),
          ],
        );
      },


      listener: (BuildContext context, ChangeFavoriteState state) {
        final cubit = context.read<ChangeFavoriteCubit>();
        if (state is ChangeFavouriteFailure &&
            !cubit.hasShownFailureToast) {
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
