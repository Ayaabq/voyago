import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/utils/services_locater.dart';
import 'package:voyago/feature/trip&booking/data/repo/trip_details_repo/trip_details_repo_impl.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_detials_cubit/trip_info_1_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/image_slider/text_column.dart';
import '../../../../../../core/utils/screen_size_util.dart';
import '../../../../../images/data/repo/images_repo_impl.dart';
import '../../../../../images/presentation/manager/all_images_cubit/images_cubit.dart';
import 'image_slider.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key, required this.id});
    final int id;
  @override
  Widget build(BuildContext context) {
    return
    MultiBlocProvider(
        providers:[
          BlocProvider(
          create: (_)=> TripDetailsCubit(getIt.get<TripDetailsRepoImp>()),
        ),
          BlocProvider(
            create: (context) => AllImagesCubit(getIt.get<ImagesRepoImpl>()),

          )
        ],
        child:
        Card(
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
                ImageSlider(id: id,),
                 TexColumn(id: id,)
              ],
            ),
          ),
        )
    );
  }
}
