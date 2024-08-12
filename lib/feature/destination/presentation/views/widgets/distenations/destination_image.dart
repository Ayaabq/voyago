import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/helper/images_helper.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/core/widgets/custom_failure_error.dart';
import 'package:voyago/core/widgets/shimmer/load_base.dart';
import 'package:voyago/feature/images/presentation/manager/images_cubit.dart';
import 'package:voyago/feature/images/presentation/manager/images_state.dart';

class DestinationImage extends StatelessWidget {
  const DestinationImage({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    context
        .read<ImageCubit>()
        .fetchTripDetailsInfo1(Confg.destinationImage, id);
    return BlocBuilder<ImageCubit, ImageState>(builder: (context, state) {
      if (state is ImageSuccess) {
        if (state.image != null) {

          return Image.network(
            ImagesHelper.fixUrl(state.image!),
            fit: BoxFit.cover,
          );
        } else {
          return Image.asset(
            AssetsData.noImage,
            fit: BoxFit.cover,
          );
        }
      } else if (state is ImageFailure) {
        print(state.errorMessage);
        print(state.errorMessage);
        return CustomFailureError(errMessage: state.errorMessage);
      } else {
        return LoadBase(
          child: Image.asset(
            AssetsData.noImage,
            fit: BoxFit.cover,
          ),
        );
      }
    });
  }
}
