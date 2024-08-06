import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/feature/favorite/presentation/views/widgets/favorite_icon_button.dart';
import 'package:voyago/feature/home/presentation/views/widgets/trip_search/widgets/search_trip_image.dart';

class TripSearchCard extends StatelessWidget {
  const TripSearchCard({super.key, required this.fromPrice});
  final String fromPrice;
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return Flexible(
      child: InkWell(
        onTap:   (){
    GoRouter.of(context).push(AppRouter.kTripDetailsView);
    },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Stack(
            children: [
              Card(
                elevation: 4,
                child: SearchTripImage(fromPrice: fromPrice),
              ),
              const Align(
                  alignment:AlignmentDirectional.topEnd,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 14),

                    child: FavoriteButton(),
                  )),
            ],
          ),

        ),
      ),
    );
  }
}

