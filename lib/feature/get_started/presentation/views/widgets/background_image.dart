import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
     width: double.infinity,
     height: double.infinity,
      imageUrl,
      fit: BoxFit.fill,
    );
  }
}
