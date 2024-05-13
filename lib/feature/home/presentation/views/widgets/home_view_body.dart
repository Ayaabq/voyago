import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voyago/feature/home/presentation/views/widgets/custom_back_ground.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: CustomBackground(),
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
