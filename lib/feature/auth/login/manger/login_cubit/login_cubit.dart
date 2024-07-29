// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:voyago/feature/auth/login/data/weather_repo/login_repo.dart';
// import 'package:voyago/feature/auth/login/manger/login_cubit/login_state.dart';

// import '../../../../../destination/utils/storge_token.dart';
// import '../../data/model/login_model.dart';

// class LoginCubit extends Cubit<LoginState> {
//   final LoginRepo authRepository;
//   final TokenStorage tokenStorage;

//   LoginCubit(this.authRepository, this.tokenStorage) : super(LoginInitial());

//   Future<void> login(LoginModel loginModel) async {
//     emit(LoginLoading());

//     final result = await authRepository.login(loginModel);

//     result.fold(
//       (failure) => emit(LoginFailure(failure.toString())),
//       (tokens) => emit(LoginSuccess(
//         accessToken: tokens.toString(),
//         refreshToken: tokens.toString(),
//       )),
//     );
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:voyago/core/utils/storge_token.dart';
import 'package:voyago/feature/auth/login/data/repo/login_repo.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  final FlutterSecureStorage secureStorage;

  LoginCubit(this.loginRepo, this.secureStorage) : super(LoginInitial());

  Future<void> fetchLogin(String username, String password) async {
    emit(LoginLoading());

    var result = await loginRepo.loginData(username, password);
    result.fold(
      (failure) => emit(LoginFailure(failure.errMessage)),
      (success) async {
        //    await _storeTokens(success.accessToken, success.refreshToken);
        await AppStorage.instance
            .writeData(AppStorage.TOKEN, success.accessToken);
        await AppStorage.instance
            .writeData(AppStorage.REFTOKEN, success.refreshToken);
        emit(LoginSuccess(success.accessToken, success.refreshToken));

        dynamic token = await AppStorage.instance.readData(AppStorage.TOKEN);
      },
    );
  }

  // Future<void> _storeTokens(String accessToken, String refreshToken) async {
  //   await secureStorage.write(key: 'accessToken', value: accessToken);
  //   await secureStorage.write(key: 'refreshToken', value: refreshToken);
  // }
}
