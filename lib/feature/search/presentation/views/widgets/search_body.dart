import 'package:flutter/material.dart';
import 'package:voyago/feature/search/presentation/views/widgets/attractions_search_grid.dart';
import 'package:voyago/feature/search/presentation/views/widgets/back.dart';
import 'package:voyago/feature/search/presentation/views/widgets/trip_search_list.dart';

import '../../../../../core/utils/custom_colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/background/custom_back_ground.dart';

class SearchBodyView extends StatefulWidget {
  const SearchBodyView({super.key, required this.type});

  final String type;

  @override
  State<SearchBodyView> createState() => _SearchBodyViewState();
}

class _SearchBodyViewState extends State<SearchBodyView> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool haveRow = widget.type == "all";
    final tripView = [
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
      const TripSearchList(),
    ];

    final attractionView = [
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "All Attractions",
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
      // const AttractionsSearchGrid(),
    ];

    return Stack(
      children: [
        const CustomBackground(),
        CustomScrollView(
          slivers: [
            BackgroundSectionSearch(
              haveRow: haveRow,
              searchController: searchController, haveFilters: false,
            ),
            if (widget.type == "trip" && searchController.text.isNotEmpty)
              ...tripView,
            if (widget.type == "attraction" &&
                searchController.text.isNotEmpty)
              ...attractionView,
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
