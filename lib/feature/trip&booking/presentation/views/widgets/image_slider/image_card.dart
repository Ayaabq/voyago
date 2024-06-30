import 'package:flutter/material.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/image_slider/text_column.dart';
import '../../../../../../core/utils/screen_size_util.dart';
import 'image_slider.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Increase the radius here
      ),
      elevation: 4,
      margin: EdgeInsets.zero, // Remove card margin

      child: SizedBox(
        height: ScreenSizeUtil.dynamicHeight(475 / 812),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImageSlider(),
            const TexColumn()
          ],
        ),
      ),
    );
  }
}
