import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/search/presentation/manager/filters_cubit.dart';
import 'package:voyago/feature/search/presentation/manager/trip_search/trip_search_cubit.dart';
import 'package:voyago/feature/search/presentation/views/widgets/attractions_search_grid.dart';
import 'package:voyago/feature/search/presentation/views/widgets/back.dart';
import 'package:voyago/feature/search/presentation/views/widgets/trip_search_list.dart';

import '../../../../core/utils/custom_colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/views/widgets/background/custom_back_ground.dart';

class TripSearch extends StatefulWidget {
  const TripSearch({super.key});

  @override
  State<TripSearch> createState() => _TripSearchState();
}

class _TripSearchState extends State<TripSearch> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      context.read<TripSearchCubit>().fetchTripsInitial(searchController.text, null);
    });
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBackground(),
          CustomScrollView(
            slivers: [
              BackgroundSectionSearch(
                where: searchController.text,
                haveRow: false,
                searchController: searchController,
                haveFilters: true,
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "All Trips",
                        textAlign: TextAlign.start,
                        style: Styles.textStyle20W700.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? CustomColors.kWhite[0]
                              : CustomColors.kMove[8],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               TripSearchList(destination: searchController.text,),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
