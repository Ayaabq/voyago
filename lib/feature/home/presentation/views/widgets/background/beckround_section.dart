import 'package:flutter/material.dart';
import 'package:voyago/feature/home/presentation/views/widgets/whether_info.dart';

import '../app_bar/custom_app_bar.dart';
import '../categories/categories_row.dart';
import 'custom_back_ground.dart';
import '../dummy_discount.dart';

class BackgroundSection extends StatelessWidget {
  const BackgroundSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Stack(
        children: [
          CustomBackground(),
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10, top: 40),
            child: Column(
              children: [
                CustomAppBar(),
                WhetherInfo(
                  country: "Damascus",
                  degree: 17,
                ),
                SizedBox(
                  height: 8,
                ),
                CategoriesRow(),
                SizedBox(
                  height: 17,
                ),
                DummyDiscount()
              ],
            ),
          )
        ],
      ),
    );
  }
}
