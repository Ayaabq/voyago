import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/screen_size_util.dart';

class CustomImageListView extends StatelessWidget {
   const CustomImageListView({super.key, required this.images, required this.onImageChosen, required this.chosenImage});
  final List<ImageProvider> images;
  final void Function(int index) onImageChosen;
  final int chosenImage;
  bool isChosen(int index){
    return index==chosenImage;
  }

  @override
  Widget build(BuildContext context) {

    ScreenSizeUtil.init(context);
    return  SizedBox(
      height: ScreenSizeUtil.dynamicHeight(90/812),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: images.length,
          itemBuilder: (context, index){
            return AspectRatio(
              aspectRatio: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child:InkWell(
                    onTap: (){
                      onImageChosen(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: isChosen(index)?Border.all(
                          color: CustomColors.kMove[5], // Set the border color here
                          width: 3.0, // Set the border width here
                        ) : null,

                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                          image: images[index],

                          fit: BoxFit.cover,
                        ),

                      ),
                    ),
                  )

                ),);
          }
      ),
    );
  }
}
