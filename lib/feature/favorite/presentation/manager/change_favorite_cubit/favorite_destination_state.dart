

import '../../../../destination/data/models/destination_model.dart';

abstract class ChangeFavoriteState {}

class ChangeFavoriteInitial extends ChangeFavoriteState {}
class ChangeFavouriteFailure extends ChangeFavoriteState {
  final String errorMessage;

  ChangeFavouriteFailure({required this.errorMessage});


  static ChangeFavouriteFailure fromJson(Map<String, dynamic> response) {
    return ChangeFavouriteFailure(errorMessage:response['err'] ?? 'Unknown error');
  }



}
class ChangeFavouriteSuccess extends ChangeFavoriteState {
  final String message;
  final int id ;

  ChangeFavouriteSuccess( {required this.message, required this.id});

  static ChangeFavouriteSuccess fromJson(
      Map<String, dynamic> response, final int id ) {
    final message = response['msg'];
    // destinationModel.changeFavouriteStatus();
    return ChangeFavouriteSuccess(id: id, message: message);
  }
}
class ChangeDestinationFavoriteLoading extends ChangeFavoriteState {}
