import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/widgets/custom_failure_error.dart';
import 'package:voyago/feature/reviews/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:voyago/feature/reviews/presentation/manager/reviews_cubit/reviews_state.dart';
import 'package:voyago/feature/reviews/presentation/veiws/widgets/reviews/ratig_diagram.dart';
import 'package:voyago/feature/reviews/presentation/veiws/widgets/reviews/review_card.dart';

import '../../../../data/models/review_model.dart';

class ReviewsViewBody extends StatelessWidget {
  const ReviewsViewBody({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    context.read<ReviewsCubit>().fetchReviewsInitial(url);
    return BlocBuilder<ReviewsCubit, ReviewsState>(builder: (context, state) {
      if (state is ReviewsSuccess) {
        final List<ReviewModel> reviews = state.reviewModel;

        return CustomScrollView(
          slivers: [
            SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverToBoxAdapter(
                    child: RatingDiagram(
                  rate: state.rate,
                  totalRate: state.totalRates!,
                  totalReviews: state.total,
                ))),
            SliverList.builder(
              itemBuilder: (context, index) => Card(
                child: ReviewCard(
                  reviewModel: reviews[index],
                ),
              ),
              itemCount: reviews.length,
            )
          ],
        );
      } else if (state is ReviewsFailure) {
        return CustomFailureError(
          errMessage: state.errorMessage,
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
