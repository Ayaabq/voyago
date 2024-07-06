
import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/home/presentation/maneger/trending_destination_state.dart';



abstract class HomeRepo {
  Future<Either<Failure, TrendingDestinationSuccess>> trendingDestination();
}
