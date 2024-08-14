import 'package:equatable/equatable.dart';

class FilterState extends Equatable {
  final String where;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int travelers;
  final double minPrice;
  final double maxPrice;
  final String sortBy;
  final bool isTopRated;

  const FilterState( {
    required this.where,
    required this.checkInDate,
    required this.checkOutDate,
    required this.travelers,
    required this.minPrice,
    required this.maxPrice,
    required this.sortBy,
    required this.isTopRated,
  });

  FilterState copyWith({
    String? where,
    DateTime? checkInDate,
    DateTime? checkOutDate,
    int? travelers,
    double? minPrice,
    double? maxPrice,
    String? sortBy,
    bool? isTopRated
  }) {
    return FilterState(
      where: where ?? this.where,
      checkInDate: checkInDate ?? this.checkInDate,
      checkOutDate: checkOutDate ?? this.checkOutDate,
      travelers: travelers ?? this.travelers,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      sortBy: sortBy ?? this.sortBy,
      isTopRated: isTopRated ?? this.isTopRated
    );
  }

  @override
  List<Object?> get props => [
    where,
    checkInDate,
    checkOutDate,
    travelers,
    minPrice,
    maxPrice,
    sortBy,
    isTopRated
  ];
}
