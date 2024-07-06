import 'package:flutter/material.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/header_vector.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({
    super.key,
    required this.imageUrl, required this.padding,
  });

  final String imageUrl;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HeaderVector(),
        const SizedBox(height: 11),
        Positioned(
          child: Padding(
            padding: padding,
            child: AspectRatio(
              aspectRatio: 2.2,
              child: Image(
                image: AssetImage(imageUrl

                    ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
