import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/review_profile/presention/views/widgets/card_attr.dart';
import 'package:voyago/feature/review_profile/presention/views/widgets/card_des.dart';

import '../../../../books/presentation/views/books_view.dart';
import '../../../card_review_trip.dart';
import '../../manger/cubit/profile_reviews_cubit_cubit.dart';
import '../../manger/cubit/profile_reviews_cubit_state.dart';
import 'reviews_empty.dart';

class ReviewsBody extends StatelessWidget {
  const ReviewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ReviewsProfCubit>().fetchReviewsProf();

    return BlocBuilder<ReviewsProfCubit, ReviewsProfState>(
        builder: (context, state) {
      if (state is ReviewsProfSuccess) {
        print("syyy");
        final trips = state.trips;
        final destinations = state.destinations;
        final attractions = state.attractions;
        if (trips.isEmpty && destinations.isEmpty && attractions.isEmpty) {
          return const Center(child:  ReviewsEmpty());
        }
        return Scaffold(
          body: CustomTabBar(
            tabs: [
              Tab(
                text: "Trips".tr(),
              ),
              Tab(
                text: "Destinations".tr(),
              ),
              Tab(
                text: "Attractions".tr(),
              ),
            ],
            titel: "My Reviews".tr(),
            tabViews: [
              ListView.builder(
                  itemCount: trips.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ReviewCardTrip(
                      trip: trips[index],
                    );
                  }),
              ListView.builder(
                  itemCount: destinations.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ReviewCardDes(
                      destinationRev: destinations[index],
                    );
                  }),
              ListView.builder(
                  itemCount: attractions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ReviewCardAttr(
                      attrationRev: attractions[index],
                    );
                  }),
            ],
          ),
        );
      } else if (state is ReviewsProfFailure) {
        print(state.errorMessage);
        return const Center(
            child:
//// CustomFailureError(errMessage: state.errorMessage));

               ReviewsEmpty()
);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
