import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_rate.dart';
import 'package:voyago/core/widgets/toast/toast_extensions.dart';
import 'package:voyago/feature/attraction/data/models/attraction_model.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/confg.dart';
import '../../../../../favorite/presentation/manager/change_favorite_cubit/favorite_cubit.dart';
import '../../../../../favorite/presentation/manager/change_favorite_cubit/favorite_state.dart';
import '../../../../../favorite/presentation/views/favorite_icon_button.dart';

class AttractionCard extends StatelessWidget {
  const AttractionCard({super.key, required this.attractionModel});
  final AttractionModel attractionModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kAttractionDetailsView, extra: attractionModel);
      },
      child: BlocConsumer<ChangeFavoriteCubit, ChangeFavoriteState>(
        builder: (ctx, state) {
          return AspectRatio(
            aspectRatio: 1,
            child: Card(
              elevation: 4,
              child: Container(
                width: 150,
                height: 170,
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            HomeAssets.dummyAttraction,
                            width: 130,
                            height: 150,
                            fit: BoxFit
                                .cover, // This ensures the image covers the entire area
                          ),
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
                            0.55,
                            0.75,
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: CustomColors.kWhite[0]),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CustomRating(rate: attractionModel.rate),
                            ),
                          ),
                          const Spacer(),
                          FavoriteButton(
                            onPressed: () {
                              context
                                  .read<ChangeFavoriteCubit>()
                                  .addIDItem2Favourite(attractionModel.id,
                                      Confg.addAttractionFavouriteUrl,
                                      attractionModel: attractionModel);
                            },
                            isFavorite: attractionModel.isFavourite,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(attractionModel.name,
                            style:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Styles.textStyle14W600dark
                                    : Styles.textStyle14W600),
                      ),
                    )
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
      ),
    );
  }
}
