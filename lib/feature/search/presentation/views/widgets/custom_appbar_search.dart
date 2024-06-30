import 'package:flutter/material.dart';
import 'package:voyago/feature/search/presentation/views/widgets/filter_search.dart';
import 'package:voyago/feature/search/presentation/views/widgets/search_elv.dart';

import '../../../../../core/utils/custom_colors.dart';

class CustomAppBarSearch extends StatelessWidget {
  const CustomAppBarSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsetsDirectional.zero,
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          // SearchElevated widget should be defined elsewhere
          SearchElevated(
            onTap: () {
              
            },
            fillColor: CustomColors.kWhite[0],
          ),
          IconButton(
            padding: EdgeInsetsDirectional.zero,
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                context: context,
                builder: (BuildContext context) {
                  return const FilterSearchTrips();
                },
              );
            },
            icon: const Icon(
              Icons.filter_list_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
