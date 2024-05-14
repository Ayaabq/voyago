import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
class CustomCardBackground extends StatelessWidget {
  const CustomCardBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        elevation: 4,
        child: Container(
          width: 130,
          height: 148,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  HomeAssets.dummyOffers,
                  width: 130,
                  height: 148,
                  fit: BoxFit.cover, // This ensures the image covers the entire area
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
                      0.6,
                      0.65,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
