
import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';

import '../../presentation/manager/destination_cubit/destination_state.dart';



abstract class DestinationRepo {
  Future<Either<Failure, DestinationSuccess>>
  getDestination(String url);
}
