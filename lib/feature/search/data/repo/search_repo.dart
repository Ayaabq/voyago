
import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/attraction/presentation/manager/attraction_state.dart';
import 'package:voyago/feature/search/presentation/manager/filters_state.dart';
import 'package:voyago/feature/search/presentation/manager/trip_search/trip_search_state.dart';




abstract class SearchRepo {
  Future<Either<Failure, TripsSearchSuccess>>
  getSearchTrips(String? destination, FilterState? filters);
}
