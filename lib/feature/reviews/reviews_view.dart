import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/custom_floating_button.dart';
import 'package:voyago/feature/reviews/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:voyago/feature/reviews/presentation/manager/single_review_cubit/single_review_cubit.dart';
import 'package:voyago/feature/reviews/presentation/veiws/widgets/reviews/review_view_body.dart';

import '../../core/utils/services_locater.dart';
import 'data/repo/review_repo_impl.dart';



class ReviewView extends StatelessWidget {
  const ReviewView({super.key, required this.url, required this.addUrl});
final String url;
final String addUrl;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title:  Text("Reviews".tr()),
        ),
        body:MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ReviewsCubit(getIt.get<ReviewRepoImp>()),
            ),
            BlocProvider(
              create: (context) => SingleReviewCubit(getIt.get<ReviewRepoImp>()),
            ),
          ],
          child:  ReviewsViewBody(url: url,),
        ),
        floatingActionButton:  CustomFloatingButton(url: addUrl,),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

