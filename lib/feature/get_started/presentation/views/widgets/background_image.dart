import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        width: double.infinity,
        height: double.infinity,
        imageUrl,
        fit: BoxFit.fill,
      ),
      Container(
          width: double.infinity,
          height: double.infinity,
          decoration:  const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 1, 1, 1),
                  Color.fromARGB(0, 1, 1, 1)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          )),
    ]);
  }
}
