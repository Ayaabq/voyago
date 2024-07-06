import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/services_locater.dart';
import 'package:voyago/feature/home/data/repo/desrination_repo_impl.dart';
import 'package:voyago/feature/home/presentation/maneger/trinding_destination_cubit.dart';
import 'package:voyago/feature/home/presentation/views/widgets/home_view_body.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TrendingDestinationCubit(getIt.get<HomeRepoImp>()),
          )
          ,
        ],
    child: const HomeViewBody());



  }
}
