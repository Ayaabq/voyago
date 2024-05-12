import 'package:flutter/material.dart';
import 'package:voyago/core/utils/assets.dart';

class HeaderVector extends StatelessWidget {
  const HeaderVector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          height: 246,
          child: Image(
            image: AssetImage(LoginAssets.vector1),
          ),
        ),
        Spacer(),
        SizedBox(
          height: 246,
          child: Image(
            image: AssetImage(
              LoginAssets.vector2,
            ),
          ),
        ),
      ],
    );
  }
}
