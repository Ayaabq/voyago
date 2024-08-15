
import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/attraction/presentation/manager/attraction_state.dart';




abstract class AttractionRepo {
  Future<Either<Failure, AttractionSuccess>>
  getAttraction(String url);
  Future<Either<Failure, AttractionSuccess>>
  getSearchAttraction(String destination);
}
