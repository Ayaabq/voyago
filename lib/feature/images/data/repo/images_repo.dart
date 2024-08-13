import 'package:dartz/dartz.dart';
import 'package:voyago/feature/images/presentation/manager/all_images_cubit/images_state.dart';
import 'package:voyago/feature/images/presentation/manager/images_state.dart';

import '../../../../core/errors/failure.dart';
import '../../../place/presentaion/manager/place_info_section_cubit/place_info_section_state.dart';

abstract class ImagesRepo{

  Future<Either<Failure, ImageSuccess>>
  getImage(String url, int id );
   Future<Either<Failure, AllImageSuccess>>
  getAllImage(String url, int id );

}