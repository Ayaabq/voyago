import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/services_locater.dart';
import 'package:voyago/feature/core/data/repo/core_impl.dart';
import 'package:voyago/feature/core/presentation/manager/favotire_destination_cubit/favorite_destination_cubit.dart';
import 'package:voyago/feature/home/presentation/views/widgets/home_view_body.dart';

import '../../../core/presentation/manager/destination_cubit/destination_cubit.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DestinationCubit(getIt.get<CoreRepoImp>()),
          )
          ,
          BlocProvider(
            create: (context) => ChangeFavoriteDestinationCubit(getIt.get<CoreRepoImp>()),
          )
          ,
        ],
    child: const HomeViewBody());



  }
}
