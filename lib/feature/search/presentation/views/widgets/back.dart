import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voyago/feature/search/presentation/views/widgets/categories_row_search.dart';
import 'package:voyago/feature/search/presentation/views/widgets/custom_appbar_search.dart';

import '../../../../home/presentation/views/widgets/background/custom_back_ground.dart';

class BackgroundSectionSearch extends StatelessWidget {
  const BackgroundSectionSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Stack(
        children: [
          CustomBackground(),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 40),
            child: Column(
              children: [
                CustomAppBarSearch(),
                SizedBox(
                  height: 14,
                ),
                CategoriesRowSearch(),
                SizedBox(
                  height: 17,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


   


