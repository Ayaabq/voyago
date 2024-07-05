part of 'rest_password_cubit.dart';

abstract class RestPasswordState {}

class RestPasswordInitial extends RestPasswordState {}

class RestPasswordLoading extends RestPasswordState {}

class RestPasswordSuccess extends RestPasswordState {
  final String message;
  

  RestPasswordSuccess(this.message );

  static RestPasswordSuccess fromJson(Map<String, dynamic> response) {
    return RestPasswordSuccess(response['msg']);
  }
}


class RestPasswordFailure extends RestPasswordState {
  final String errorMessage;
 RestPasswordFailure(this.errorMessage);

static RestPasswordFailure fromJson(Map<String, dynamic> response) {
    return RestPasswordFailure(response['err'],);
  }
}
