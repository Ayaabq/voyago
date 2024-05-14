import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/header_vector.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HeaderVector(),
        const SizedBox(height: 11),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(top: 52),
            child: AspectRatio(
              aspectRatio: 2.2,
              child: Image(
                image: AssetImage(imageUrl
//AssetsData.logoAllColors
                    ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
