part of 'code_forgot_password_cubit.dart';

abstract class CodeForgotPasswordState {}

class CodeForgotPasswordInitial extends CodeForgotPasswordState {}

class CodeForgotPasswordLoading extends CodeForgotPasswordState {}

class CodeForgotPasswordSuccess extends CodeForgotPasswordState {
  final String message;

  CodeForgotPasswordSuccess(this.message);

  static CodeForgotPasswordSuccess fromJson(Map<String, dynamic> response) {
    return CodeForgotPasswordSuccess(response['msg']);
  }
}

class CodeForgotPasswordFailure extends CodeForgotPasswordState {
  final String errorMessage;
  CodeForgotPasswordFailure(this.errorMessage);

  static CodeForgotPasswordFailure fromJson(Map<String, dynamic> response) {
    return CodeForgotPasswordFailure(
      response['err'],
    );
  }
}
