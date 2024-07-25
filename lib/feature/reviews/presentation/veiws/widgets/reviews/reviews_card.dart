import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/reviews/presentation/veiws/widgets/reviews/reviews_conlumn.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/services_locater.dart';
import '../../../../data/repo/review_repo_impl.dart';
import '../../../manager/reviews_cubit/reviews_cubit.dart';

class ReviewsCard extends StatelessWidget {
  const ReviewsCard({super.key, required this.url, required this.fullUrl});
  final String url;
  final String fullUrl;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: "Reviews",
      onTap: () {
        GoRouter.of(context).push(AppRouter.kReviewsView, extra: fullUrl);
      },
      content: BlocProvider(
        create: (context) => ReviewsCubit(getIt.get<ReviewRepoImp>()),
        child: ReviewsConlumn(
          url: url,
        ),
      ),
    );
  }
}
