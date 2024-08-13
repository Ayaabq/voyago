import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../../../../core/utils/services_locater.dart';
import '../../../../images/data/repo/images_repo_impl.dart';
import '../../../../images/presentation/manager/images_cubit.dart';
import '../../../../images/presentation/views/custom)netowk_image.dart';

class PlaceDetailsBackground extends StatelessWidget {
  const PlaceDetailsBackground({super.key, required this.id, required this.url});
  final int id;
  final String url;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        BlocProvider(
          create: (context) => ImageCubit(getIt.get<ImagesRepoImpl>()),
          child: CustomNetworkImage(id: id, url: url, height: ScreenSizeUtil.screenHeight * .35, width: ScreenSizeUtil.screenWidth,),

        ),
        Container(
          height: ScreenSizeUtil.screenHeight * .36,
          width: ScreenSizeUtil.screenWidth,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(74, 255, 255, 255),

                  Color.fromARGB(0, 1, 1, 1),
                ],
              )),
        ),
      ],
    );
  }
}
