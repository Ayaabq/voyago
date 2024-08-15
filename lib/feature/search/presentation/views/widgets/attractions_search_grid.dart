import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/widgets/custom_failure_error.dart';
import 'package:voyago/feature/attraction/data/models/attraction_model.dart';
import 'package:voyago/feature/attraction/presentation/manager/attractoin_cubit.dart';
import 'package:voyago/feature/search/presentation/manager/filters_state.dart';

import '../../../../attraction/presentation/manager/attraction_state.dart';
import '../../../../attraction/presentation/views/widgets/attractions/attraction_card.dart';

class AttractionsSearchGrid extends StatelessWidget {
  const AttractionsSearchGrid({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    context.read<AttractionCubit>().fetchSearchAttraction(text);

    return BlocBuilder<AttractionCubit, AttractionState>(
        builder: (context, state) {
      if (state is AttractionSuccess) {
        final attractions = state.attractionModel;
        return SliverGrid.builder(
          // padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 16.0, // Space between columns
            mainAxisSpacing: 16.0, // Space between rows
          ),
          itemCount: attractions.length,
          itemBuilder: (context, index) {
            return AttractionCard(attractionModel: attractions[index]);
          },
        );
      } else if (state is AttractionFailure) {
        return SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                CustomFailureError(errMessage: state.errorMessage),
              ],
            ));
      } else if (state is AttractionLoading) {
        return const SliverToBoxAdapter(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            CircularProgressIndicator(),
          ],
        ));
      } else {
        return const SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("search for attraction all around the wodr!"),
              ],
            ));
      }
    });
  }
}
