import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/widgets/shimmer/load_base.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_info_1_model.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_detials_cubit/trip_info_1_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_detials_cubit/trip_info_1_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/image_slider/column_shimmer_loading.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_failure_error.dart';
import '../../../../../../core/widgets/custom_rate.dart';
import '../../../../../../core/widgets/location_with_country.dart';
import '../../../../../../core/widgets/shimmer/load_List.dart';

class TexColumn extends StatelessWidget {
  const TexColumn({super.key, required this.id});
    final int id;
  @override
  Widget build(BuildContext context) {
    context.read<TripDetailsCubit>().fetchTripDetailsInfo1(id);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 380;
          const padding = 10.0;
          final textSizeTitle = isSmallScreen ? 16.0 : 20.0;
          final textSizeReview = isSmallScreen ? 11.0 : 13.0;

          return BlocBuilder<TripDetailsCubit, TripInfo1State>(
            builder: (context, state) {
              if (state is TripInfo1Success) {
                TripInfo1Model trip = state.tripInfo1Model;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trip.name,
                      style: TextStyle(
                        fontSize: textSizeTitle,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      // alignment: WrapAlignment.spaceBetween,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         LocationWithCountry(country: trip.location),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: padding, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey[300],
                            ),
                            child:  LocationWithCountry(
                                country: "View on Map".tr()),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // alignment: WrapAlignment.spaceBetween,
                      children: [
                         CustomRating(rate: trip.rate),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: padding, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey[300],
                          ),
                          child: Text(
                            "${trip.reviews} ${"reviews".tr()}",
                            style: TextStyle(
                              fontSize: textSizeReview,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else if (state is TripInfo1Failure) {
                return CustomFailureError(errMessage: state.errorMessage);
              } else {
                return const LoadBase(
                  child: ColumnShimmerLoading(
                    padding: padding,
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
