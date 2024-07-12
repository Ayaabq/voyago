import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/services_locater.dart';
import 'package:voyago/feature/attraction/data/repo/attraction_repo_impl.dart';
import 'package:voyago/feature/attraction/presentation/manager/attractoin_cubit.dart';
import 'package:voyago/feature/favorite/data/repo/favorite_repo_impl.dart';
import 'package:voyago/feature/home/presentation/views/widgets/home_view_body.dart';

import '../../../destination/data/repo/destination_repo_impl.dart';
import '../../../destination/presentation/manager/destination_cubit/destination_cubit.dart';
import '../../../favorite/presentation/manager/change_favorite_cubit/favorite_destination_cubit.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [

          BlocProvider(
            create: (context) => ChangeFavoriteCubit(getIt.get<FavoriteRepoImp>()),
          )

          ,
        ],
    child: const HomeViewBody());



  }
}
