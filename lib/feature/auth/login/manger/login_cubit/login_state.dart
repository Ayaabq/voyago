// abstract class LoginState {}

// class LoginInitial extends LoginState {}

// class LoginLoading extends LoginState {}

// class LoginSuccess extends LoginState {
//   final String accessToken;
//   final String refreshToken;

//   LoginSuccess({required this.accessToken, required this.refreshToken});

//   static LoginSuccess fromJson(Map<String, dynamic> response) {
//     return response['meg'];
//   }
// }

// class LoginFailure extends LoginState {
//   final String errorMessage;

//   LoginFailure(this.errorMessage);

//   static LoginFailure fromJson(Map<String, dynamic> response) {
//     return LoginFailure(response['err']);
//   }
// }





abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String accessToken;
  final String refreshToken;

  LoginSuccess(this.accessToken, this.refreshToken);

  static LoginSuccess fromJson(Map<String, dynamic> response) {
    return LoginSuccess(
      response['data']['accessToken'],
      response['data']['refreshToken'],
    );
  }
}

class LoginFailure extends LoginState {
  final String errorMessage;
  LoginFailure(this.errorMessage);

  static LoginFailure fromJson(Map<String, dynamic> response) {
    return LoginFailure(response['err'] ?? 'Unknown error');
  }
}
