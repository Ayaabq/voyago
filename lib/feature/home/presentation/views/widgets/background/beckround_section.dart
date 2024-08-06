import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/home/data/repo/weather_repo/weather_repo_impl.dart';
import 'package:voyago/feature/home/presentation/maneger/weather_cubit/weather_cubit.dart';
import 'package:voyago/feature/home/presentation/views/widgets/whether_info.dart';

import '../../../../../../core/utils/services_locater.dart';
import '../app_bar/custom_app_bar.dart';
import '../categories/categories_row.dart';
import '../custom_home_list.dart';
import '../trip_search/trip_offers_search/trip_offer_listview.dart';
import 'custom_back_ground.dart';
import '../dummy_discount.dart';

class BackgroundSection extends StatelessWidget {
  const BackgroundSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only( top: 40, left: 10, right: 10),
        child: Column(
          children: [
            const CustomAppBar(),
            BlocProvider(
            create: (context) => WeatherCubit(getIt.get<WeatherRepoImpl>()),
            child: const WhetherInfo(
              country: "Damascus",
              degree: 17,
            ),),
            const SizedBox(
              height: 8,
            ),
            const CategoriesRow(),
            const SizedBox(
              height: 17,
            ),

          ],
        ),
      ),
    );
  }
}
