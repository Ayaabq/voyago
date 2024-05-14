import 'package:flutter/material.dart';
import 'package:voyago/feature/home/presentation/views/widgets/distenations/destination_background.dart';

import '../../../../../../core/utils/assets.dart';

class DestinationItem extends StatelessWidget {
  const DestinationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 4,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        child: DestinationBackground()
      ),
    );
  }
}
