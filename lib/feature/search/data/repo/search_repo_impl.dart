import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/feature/attraction/data/repo/attraction_repo.dart';
import 'package:voyago/feature/attraction/presentation/manager/attraction_state.dart';
import 'package:voyago/feature/search/data/repo/search_repo.dart';
import 'package:voyago/feature/search/presentation/manager/trip_search/trip_search_state.dart';

import '../../../../core/domain/services/api.dart';
import '../../presentation/manager/filters_state.dart';


class SearchRepoImp implements SearchRepo {
  final ApiServices api;

  SearchRepoImp(this.api);


  @override
  Future<Either<Failure, TripsSearchSuccess>> getSearchTrips(String? destination, FilterState? filters) async{
    String filter="";
    if(destination==null){
    destination ??= filters!.where;
    bool priceLtoH=filters!.sortBy=='Price (low to high)';

       filter =
          "&maxPrice=${filters.maxPrice}&minPrice=${filters.minPrice}&travelers=${filters.travelers}&checkIn=${filters.checkInDate}&checkOut=${filters.checkOutDate}&"
          "priceLtoH=$priceLtoH&priceHtoL=${!(priceLtoH)}&topRated=${filters.isTopRated}";
    }else {
      filter=destination;
    }
    try {
      var response = await api.get(Confg.tripSearch+filter, hasToken: true);
      return right(TripsSearchSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }




}
