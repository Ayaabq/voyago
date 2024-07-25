import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/custom_floating_button.dart';
import 'package:voyago/feature/reviews/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:voyago/feature/reviews/presentation/veiws/widgets/reviews/review_view_body.dart';

import '../../core/utils/services_locater.dart';
import 'data/repo/review_repo_impl.dart';



class ReviewView extends StatelessWidget {
  const ReviewView({super.key, required this.url});
final String url;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Reviews'),
        ),
        body: BlocProvider(
          create: (context) => ReviewsCubit(getIt.get<ReviewRepoImp>()),
          child:  ReviewsViewBody(url: url,),
        ),
        floatingActionButton: const CustomFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

