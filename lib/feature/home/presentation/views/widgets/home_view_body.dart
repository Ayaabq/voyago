import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voyago/feature/home/presentation/views/widgets/app_bar/custom_app_bar.dart';
import 'package:voyago/feature/home/presentation/views/widgets/beckround_section.dart';
import 'package:voyago/feature/home/presentation/views/widgets/categories/categories_row.dart';
import 'package:voyago/feature/home/presentation/views/widgets/custom_back_ground.dart';
import 'package:voyago/feature/home/presentation/views/widgets/dummy_discount.dart';
import 'package:voyago/feature/home/presentation/views/widgets/whether_info.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          BackgroundSection(),
          SliverToBoxAdapter(
            child: Column(
              children: [

              ],
            ),
          )
        ],
      ),
    );
  }
}
