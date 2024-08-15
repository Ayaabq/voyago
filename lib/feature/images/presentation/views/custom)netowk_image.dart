import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/helper/images_helper.dart';
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/core/widgets/custom_failure_error.dart';
import 'package:voyago/core/widgets/shimmer/load_base.dart';
import 'package:voyago/feature/images/presentation/manager/images_cubit.dart';
import 'package:voyago/feature/images/presentation/manager/images_state.dart';

class CustomNetworkImage extends StatefulWidget {
  const CustomNetworkImage({super.key, required this.id, required this.url, this.width, this.height});
  final int id;
  final String url;
  final double? width;
  final double? height;

  @override
  State<CustomNetworkImage> createState() => _CustomNetworkImageState();
}

class _CustomNetworkImageState extends State<CustomNetworkImage> {

  @override
  void initState() {
     context
        .read<ImageCubit>()
        .fetchTripDetailsInfo1(widget.url, widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final counterCubit1 = BlocProvider.of<ImageCubit>(context, listen: false);


    return BlocBuilder<ImageCubit, ImageState>(
      // bloc: counterCubit1,
        builder: (context, state) {

      if (state is ImageSuccess) {
        if (state.image != null) {

          return Image.network(
            width: widget.width,
            height: widget.height,
            ImagesHelper.fixUrl(state.image!),
            fit: BoxFit.cover,
          );
        } else {
          return Image.asset(
            width: widget.width,
            height: widget.height,
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
            width: widget.width,
            height: widget.height,
            AssetsData.noImage,
            fit: BoxFit.cover,
          ),
        );
      }
    });
  }
}
