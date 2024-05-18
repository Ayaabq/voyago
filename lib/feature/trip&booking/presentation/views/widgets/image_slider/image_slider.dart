import 'package:flutter/material.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/image_slider/custom_image_list_view.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/screen_size_util.dart';

class ImageSlider extends StatefulWidget {
   ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final List<ImageProvider> images =const [
    AssetImage(HomeAssets.dummyOffers),
    AssetImage(HomeAssets.dummyDestination),
    AssetImage(HomeAssets.dummyDiscount),
    AssetImage(HomeAssets.dummyOffers),
    AssetImage(HomeAssets.dummyDestination),
    AssetImage(HomeAssets.dummyDiscount)
  ];

  int chosenImage=0;

  void setImage(int index){
    setState(() {
      chosenImage=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return   Column(
      children: [
        Image(
          image: images[chosenImage],
          width: double.infinity,
          height: ScreenSizeUtil.dynamicHeight(285/812),
          fit: BoxFit.cover,
        ),

        CustomImageListView(images: images,
        onImageChosen: setImage,
        chosenImage: chosenImage,),

      ],
    );
  }
}
