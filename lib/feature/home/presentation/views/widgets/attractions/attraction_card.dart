import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_rate.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/widgets/favorite_icon_button.dart';

class AttractionCard extends StatelessWidget {
  const AttractionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 4,
        child: Container(

          width: 150,
          height: 170,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 8,
                right: 8,
                left: 8,
                bottom: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      HomeAssets.dummyAttraction,
                      width: 130,
                      height: 150,
                      fit: BoxFit.cover, // This ensures the image covers the entire area
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color.fromARGB(0, 255, 255, 255),
                      Colors.white,
                    ],
                    stops: [
                      0.0,
                      0.55,
                      0.75,
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        color: CustomColors.kWhite[0]
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: CustomRating(rate: 4.7),
                      ),
                    ),
                    const Spacer(),
                    const FavoriteButton(),

                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text("Belvedere Castle",
                  style: Styles.textStyle14W600,),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
