

import 'package:voyago/feature/notification/data/model/notification_model.dart';

import 'package:equatable/equatable.dart';

abstract class FavoriteState extends Equatable{

  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final List<NotificationModel> notificationsModels;

  FavoriteSuccess(this.notificationsModels);
  @override
  List<Object?> get props => [notificationsModels];
  static FavoriteSuccess fromJson(Map<String, dynamic> response) {
    final notifications = (response['data'] as List)
        .map((e) => NotificationModel.fromJson(e))
        .toList();
    return FavoriteSuccess(notifications);
  }
}


class FavoriteFailure extends FavoriteState {
  final String errorMessage;
  FavoriteFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
  static FavoriteFailure fromJson(Map<String, dynamic> response) {
    return FavoriteFailure(response['err'] ?? 'Unknown error');
  }



}
