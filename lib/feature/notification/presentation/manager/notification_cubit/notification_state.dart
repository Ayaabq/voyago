

import 'package:voyago/feature/notification/data/model/notification_model.dart';

import 'package:equatable/equatable.dart';

abstract class NotificationState extends Equatable{

  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationSuccess extends NotificationState {
  final List<NotificationModel> notificationsModels;

  NotificationSuccess(this.notificationsModels);
  @override
  List<Object?> get props => [notificationsModels];
  static NotificationSuccess fromJson(Map<String, dynamic> response) {
    final notifications = (response['data'] as List)
        .map((e) => NotificationModel.fromJson(e))
        .toList();
    return NotificationSuccess(notifications);
  }
}


class NotificationFailure extends NotificationState {
  final String errorMessage;
  NotificationFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
  static NotificationFailure fromJson(Map<String, dynamic> response) {
    return NotificationFailure(response['err'] ?? 'Unknown error');
  }



}
