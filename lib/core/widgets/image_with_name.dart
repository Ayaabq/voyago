import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/styles.dart';

class ImageWithName extends StatelessWidget {
  const ImageWithName({super.key, required this.image, required this.title});
  final ImageProvider image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(AssetsData.logoAllColors),),
        SizedBox(width: 20,),
        Text(title,
        style: Styles.textStyle14W600,)

      ],
    );
  }
}
