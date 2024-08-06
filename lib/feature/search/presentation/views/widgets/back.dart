import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/trip_offers_search/trip_offer_listview.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/trip_search_list_view.dart';
import 'package:voyago/feature/search/presentation/views/widgets/categories_row_search.dart';
import 'package:voyago/feature/search/presentation/views/widgets/custom_appbar_search.dart';

import '../../../../home/presentation/views/widgets/background/custom_back_ground.dart';
import '../../../../home/presentation/views/widgets/custom_home_list.dart';

class BackgroundSectionSearch extends StatelessWidget {
  const BackgroundSectionSearch({super.key,  this.haveRow=true, required this.searchController});
  final bool haveRow;
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Padding(
       padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
       child: Column(
         children: [
            CustomAppBarSearch(searchController: searchController,),
           const SizedBox(
             height: 14,
           ),
           if(haveRow)
             const CategoriesRowSearch(),
           const SizedBox(
             height: 17,
           ),
           // CustomHomeList(
           //   title: "Offers trips".tr(),
           //   sizedList: const TripsOffersListView(),
           // ),
         ],
       ),
                ),
    );
  }
}


   


