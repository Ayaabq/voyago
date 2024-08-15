import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/confg.dart';

import 'package:voyago/feature/home/presentation/views/widgets/trip_search/widgets/colum_search_trip.dart';
import 'package:voyago/feature/images/presentation/views/custom)netowk_image.dart';
import 'package:voyago/feature/search/data/models/search_trip_model.dart';

import '../../../../../../images/presentation/manager/images_cubit.dart';

class SearchTripImage extends StatelessWidget {
  const SearchTripImage({
    super.key, required this.trip,

  });

final TripSearchModel trip;
  @override
  Widget build(BuildContext context) {
    context
        .read<ImageCubit>()
        .fetchTripDetailsInfo1(Confg.tripImage, trip.id);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          CustomNetworkImage(id: trip.id, url: Confg.tripImage, height: 170,width: double.infinity,),
          Container(
            height: 170,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  const Color(0xff5E4DA7).withOpacity(0.8),
                  const Color(0xffFEFEFF).withOpacity(0.0),
                ],
              ),
            ),
            child: Padding(
              padding:
              const EdgeInsets.only(left: 16, right: 8, top: 18, bottom: 11),
              child: ColumnSearchTrip( tripSearchModel: trip,),
            ),
          ),
        ],
      ),
    );
    //   Container(
    //
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(14),
    //     image: const DecorationImage(
    //       image: AssetImage(HomeAssets.dummyOffers),
    //       fit: BoxFit.fill,
    //     ),
    //   ),
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(16),
    //     child: Container(
    //       decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //           begin: Alignment.centerLeft,
    //           end: Alignment.centerRight,
    //           colors: [
    //             const Color(0xff5E4DA7).withOpacity(0.5),
    //             const Color(0xffFEFEFF).withOpacity(0.0),
    //           ],
    //         ),
    //       ),
    //       child: Padding(
    //         padding:
    //             const EdgeInsets.only(left: 16, right: 8, top: 18, bottom: 11),
    //         child: ColumnSearchTrip( tripSearchModel: trip,),
    //       ),
    //     ),
    //   ),
    // );
  }
}
