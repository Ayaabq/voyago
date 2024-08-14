import 'package:bloc/bloc.dart';

import 'filters_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit()
      : super(FilterState(
    where: 'Damascus',
    checkInDate: DateTime.now(),
    checkOutDate: DateTime.now().add(const Duration(days: 2)),
    travelers: 3,
    minPrice: 0,
    maxPrice: 1000,
    sortBy: 'Price (low to high)', isTopRated: false,
  ));

  void updateWhere(String where) {
    emit(state.copyWith(where: where));
  }

  void updateCheckInDate(DateTime date) {
    emit(state.copyWith(checkInDate: date));
  }

  void updateCheckOutDate(DateTime date) {
    emit(state.copyWith(checkOutDate: date));
  }

  void updateTravelers(int travelers) {
    emit(state.copyWith(travelers: travelers));
  }

  void updatePriceRange(double minPrice, double maxPrice) {
    emit(state.copyWith(minPrice: minPrice, maxPrice: maxPrice));
  }

  void updateSortBy(String sortBy) {
    emit(state.copyWith(sortBy: sortBy));
  }
  void updateTopRatedState(bool v){
    emit(state.copyWith(isTopRated: v));
  }

  FilterState getFilters() {
    return state;
  }
}
