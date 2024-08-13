import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/helper/images_helper.dart';
import 'package:voyago/core/widgets/custom_failure_error.dart';
import 'package:voyago/core/widgets/shimmer/load_List.dart';
import 'package:voyago/feature/images/presentation/manager/all_images_cubit/images_cubit.dart';

import '../../../../../generated/assets.dart';
import '../../../../images/presentation/manager/all_images_cubit/images_state.dart';

class PicturesList extends StatelessWidget {
  const PicturesList({super.key, required this.id, required this.url});
  final int id;
  final String url;
  @override
  Widget build(BuildContext context) {
    context.read<AllImagesCubit>().fetchTripDetailsInfo1(url, id);
    return  SizedBox(
      height: 180,
      child: BlocBuilder<AllImagesCubit,AllImageState> (
        builder: (BuildContext context, state) {
          if(state is AllImageSuccess){
            final images= state.images;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                     ImagesHelper.fixUrl(images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }else if(state is AllImageFailure){
            return CustomFailureError(errMessage: state.errorMessage);
          }else{
            return const LoadList(isVertical: false,
            itemCount: 7,);
          }
        }
        ,),
    );
  }
}
