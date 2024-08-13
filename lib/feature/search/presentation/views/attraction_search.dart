import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/services_locater.dart';
import 'package:voyago/feature/attraction/data/repo/attraction_repo_impl.dart';
import 'package:voyago/feature/attraction/presentation/manager/attractoin_cubit.dart';
import 'package:voyago/feature/search/presentation/views/widgets/attractions_search_grid.dart';
import 'package:voyago/feature/search/presentation/views/widgets/back.dart';
import 'package:voyago/feature/search/presentation/views/widgets/trip_search_list.dart';

import '../../../../core/utils/custom_colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../home/presentation/views/widgets/background/custom_back_ground.dart';

class AttractionSearch extends StatefulWidget {
  const AttractionSearch({super.key});

  @override
  State<AttractionSearch> createState() => _AttractionSearchState();
}

class _AttractionSearchState extends State<AttractionSearch> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {

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
    return WillPopScope(
      onWillPop: ()async{
        context.read<AttractionCubit>().reset();
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: [
            const CustomBackground(),
            CustomScrollView(
              slivers: [
                BackgroundSectionSearch(
                  haveRow: false,
                  searchController: searchController, haveFilters: false,
                ),
                if(searchController.text.isNotEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "All Attractions in ${searchController.text}",
                      textAlign: TextAlign.start,
                      style: Styles.textStyle20W700.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? CustomColors.kWhite[0]
                            : CustomColors.kMove[8],
                      ),
                    ),
                  ),
                ),
                BlocProvider(
                  create: (context)=> AttractionCubit((getIt.get<AttractionRepoImp>())),
                    child:  AttractionsSearchGrid(text: searchController.text,),),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
