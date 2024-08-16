import '../../../../data/models/detiles_books.dart';

abstract class DetilesBookState {}

class BookDetilesInitial extends DetilesBookState {}

class BookDetilesLoading extends DetilesBookState {}

class BookDetilesSuccess extends DetilesBookState {
  final TripData model;

  BookDetilesSuccess(this.model);

  @override
  List<Object?> get props => [model];

  static BookDetilesSuccess fromJson(Map<String, dynamic> response) {
    final tripData = TripData.fromJson(response['data']);
    return BookDetilesSuccess(tripData);
  }
}

class BookDetilesFailure extends DetilesBookState {
  final String errorMessage;

  BookDetilesFailure(this.errorMessage);

  static BookDetilesFailure fromJson(Map<String, dynamic> response) {
    return BookDetilesFailure(response['err']);
  }
}
