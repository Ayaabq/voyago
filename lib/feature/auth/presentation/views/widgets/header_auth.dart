import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/feature/auth/presentation/views/widgets/header_vector.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        HeaderVector(),
        SizedBox(height: 11),
        Positioned(
          child: Padding(
            padding: EdgeInsets.only(top: 52),
            child: AspectRatio(
              aspectRatio: 2.2,
              child: Image(
                image: AssetImage(AssetsData.logoAllColors),
              ),
            ),
          ),
        )
      ],
    );
  }
}
