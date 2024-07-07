import 'package:flutter/material.dart';
import 'package:voyago/feature/core/data/models/destination_model.dart';

import '../../../../../../core/utils/assets.dart';
import 'destination_background.dart';

class DestinationItem extends StatelessWidget {
  const DestinationItem({super.key,  this.destinationModel});
  final DestinationModel? destinationModel;
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
        child: DestinationBackground(destinationModel: destinationModel,)
      ),
    );
  }
}
