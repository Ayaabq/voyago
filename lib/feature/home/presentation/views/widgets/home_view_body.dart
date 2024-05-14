import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voyago/feature/home/presentation/views/widgets/app_bar/custom_app_bar.dart';
import 'package:voyago/feature/home/presentation/views/widgets/categories_row.dart';
import 'package:voyago/feature/home/presentation/views/widgets/custom_back_ground.dart';
import 'package:voyago/feature/home/presentation/views/widgets/whether_info.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
        child: Stack(
          children: [
            CustomBackground(),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric( horizontal: 21),
                child: Column(
                  children: [
                    CustomAppBar(),

                    WhetherInfo(country: "Damascus",degree: 17,),
                    SizedBox(height: 8,),
                    CategoriesRow()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
        SliverToBoxAdapter(
        child: Column(
          children: [
            // Your content that appears in front of the background
          ],
        ),
      )
    ]));
  }
}
