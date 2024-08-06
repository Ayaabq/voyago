import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/core/utils/services_locater.dart';
import 'package:voyago/feature/attraction/data/models/attraction_model.dart';
import 'package:voyago/feature/attraction/presentation/views/widgets/attractions/attraction_card.dart';
import 'package:voyago/feature/destination/data/models/destination_model.dart';
import 'package:voyago/feature/destination/presentation/views/widgets/distenations/destination_item.dart';
import 'package:voyago/feature/destination/presentation/views/widgets/distenations/destinations_view.dart';
import 'package:voyago/feature/favorite/data/repo/favorite_repo_impl.dart';
import 'package:voyago/feature/favorite/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:voyago/feature/favorite/presentation/views/widgets/favorite_view_body.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_model.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/trips/trip_card.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';
import '../../../books/presentation/views/books_view.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>FavoriteCubit(getIt.get<FavoriteRepoImp>(),),
      child: const FavoriteViewBody(),);
  }
}



