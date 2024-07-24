
import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/place/presentaion/manager/place_info_section_cubit/place_info_section_state.dart';


abstract class PlaceRepo {
  Future<Either<Failure, PlaceInfoSectionSuccess>>
  getPlaceInfo(String url);

}
