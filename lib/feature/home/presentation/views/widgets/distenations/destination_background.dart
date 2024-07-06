import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/home/data/models/destination_model.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/widgets/favorite_icon_button.dart';

class DestinationBackground extends StatelessWidget {
  const DestinationBackground({super.key, required this.destinationModel});
  final DestinationModel destinationModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [

        Image.asset(
          HomeAssets.dummyDestination,
          fit: BoxFit.cover,

          // This ensures the image covers the entire area
        ),
        Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(140, 0, 0, 0),
                  Color.fromARGB(0, 1, 1, 1),
                ],
                stops: [0.0, 0.8],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              destinationModel.name,
              style:
                  Styles.textStyle18W700.copyWith(color: CustomColors.kWhite[0]),
            ),
          ),
        ),
        Positioned(
          top: 11,
          right: 16,
          child: FavoriteButton(
            isFavorite: destinationModel.isFavourite,
          ),
        ),
      ],
    );
  }
}
