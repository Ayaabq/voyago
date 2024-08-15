import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/review_profile/data/repo/rev_profile_repo_imp.dart';

import '../../../../core/utils/services_locater.dart';
import '../manger/cubit/profile_reviews_cubit_cubit.dart';
import 'widgets/reviews_prof_body.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewsProfCubit(getIt.get<ReviewsProfRepoImp>()),
      child: const Scaffold(body: ReviewsBody()),
    );
  }
}


// class ReviewsCardView extends StatelessWidget {
//   const ReviewsCardView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: ReviewCardTrip(trip: ,
          
//         ),
//       ),
//     );
//   }
// }
