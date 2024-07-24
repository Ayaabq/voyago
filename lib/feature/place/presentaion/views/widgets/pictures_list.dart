import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';

class PicturesList extends StatelessWidget {
  const PicturesList({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            width: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                Assets.homeBackgrounSky,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
