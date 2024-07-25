import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/home/data/repo/weather_repo/weather_repo_impl.dart';
import 'package:voyago/feature/home/presentation/maneger/weather_cubit/weather_cubit.dart';
import 'package:voyago/feature/home/presentation/views/widgets/whether_info.dart';

import '../../../../../../core/utils/services_locater.dart';
import '../app_bar/custom_app_bar.dart';
import '../categories/categories_row.dart';
import 'custom_back_ground.dart';
import '../dummy_discount.dart';

class BackgroundSection extends StatelessWidget {
  const BackgroundSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Stack(
        children: [
          const CustomBackground(),
          Padding(
            padding: const EdgeInsets.only(left: 14,right: 10, top: 40),
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
                const DummyDiscount()
              ],
            ),
          )
        ],
      ),
    );
  }
}
