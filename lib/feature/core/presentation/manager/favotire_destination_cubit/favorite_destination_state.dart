
import 'package:voyago/feature/core/data/models/destination_model.dart';

abstract class ChangeDestinationFavoriteState {}

class ChangeDestinationFavoriteInitial extends ChangeDestinationFavoriteState {}
class ChangeDestinationFavouriteFailure extends ChangeDestinationFavoriteState {
  final String errorMessage;

  ChangeDestinationFavouriteFailure({required this.errorMessage});


  static ChangeDestinationFavouriteFailure fromJson(Map<String, dynamic> response) {
    return ChangeDestinationFavouriteFailure(errorMessage:response['err'] ?? 'Unknown error');
  }



}
class ChangeDestinationFavouriteSuccess extends ChangeDestinationFavoriteState {
  final String message;
  final DestinationModel destinationModel;

  ChangeDestinationFavouriteSuccess(this.destinationModel, {required this.message});

  static ChangeDestinationFavouriteSuccess fromJson(
      Map<String, dynamic> response, final DestinationModel destinationModel) {
    final message = response['msg'];
    print(message);
    destinationModel.changeFavouriteStatus();
    return ChangeDestinationFavouriteSuccess(destinationModel, message: message);
  }
}
class ChangeDestinationFavoriteLoading extends ChangeDestinationFavoriteState {}
