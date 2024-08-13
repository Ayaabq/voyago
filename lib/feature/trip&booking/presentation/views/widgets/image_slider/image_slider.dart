import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/helper/images_helper.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/core/widgets/custom_failure_error.dart';
import 'package:voyago/core/widgets/shimmer/load_base.dart';
import 'package:voyago/feature/images/presentation/manager/all_images_cubit/images_cubit.dart';
import 'package:voyago/feature/images/presentation/manager/all_images_cubit/images_state.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/image_slider/custom_image_list_view.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/screen_size_util.dart';

class ImageSlider extends StatefulWidget {
  ImageSlider({super.key, required this.id});
  final int id;
  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late List<ImageProvider> images ;

  int chosenImage = 0;
 @override
  void initState() {
    context.read<AllImagesCubit>().fetchTripDetailsInfo1(Confg.allTripImages, widget.id);
    super.initState();
  }
  void setImage(int index) {
    setState(() {
      chosenImage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return BlocBuilder<AllImagesCubit,AllImageState>(
        builder: (context,state){
          if(state is AllImageSuccess){
            images=state.images.map((e)=>NetworkImage(ImagesHelper.fixUrl(e))).toList();
            if(images.isEmpty) {
              images=[AssetImage(AssetsData.noImage)];
            }
            return  Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image(
                    image: images[chosenImage],
                    width: double.infinity,
                    height: ScreenSizeUtil.dynamicHeight(285 / 812),
                    fit: BoxFit.cover,
                  ),),
                CustomImageListView(
                  images: images,
                  onImageChosen: setImage,
                  chosenImage: chosenImage,
                ),
              ],
            );
          }else if (state is AllImageFailure){
           return CustomFailureError(errMessage: state.errorMessage);
          }else {
            return LoadBase();
          }


    });
  }
}
