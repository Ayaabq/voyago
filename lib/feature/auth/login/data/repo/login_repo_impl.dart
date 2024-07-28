// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// import 'package:voyago/destination/errors/failure.dart';

// import 'package:voyago/feature/auth/login/data/model/login_model.dart';

// import 'package:voyago/feature/auth/login/manger/login_cubit/login_state.dart';

// import '../../../../../destination/domain/services/api.dart';
// import '../../../../../destination/utils/confg.dart';
// import '../../../../../destination/utils/storge_token.dart';
// import 'login_repo.dart';

// class LoginRepoImp implements LoginRepo {
//   final ApiServices api;
// final TokenStorage tokenStorage;
//   LoginRepoImp(this.api,this.tokenStorage);

//   @override
//   Future<Either<Failure, LoginSuccess>> login(LoginModel loginModel) async {
//      try {
//       var requestBody = {
//         "username": loginModel.username,
//         "password": loginModel.password,
//       };
//       print('Request Body: $requestBody');
//       var response = await api.post(Confg.loginUrl, body: requestBody);

// if (response['data'] != null) {
//         final tokens = {
//           'accessToken': response['data']['accessToken'],
//           'refreshToken': response['data']['refreshToken'],
//         };
//         await tokenStorage.saveTokens(tokens['accessToken']!, tokens['refreshToken']!);
//         return Right(tokens);
//       } else {
//         return Left(LoginFailure(response['err']?.toString() ?? 'Login failed. Please try again.'));
//       }
//     } catch (e) {
//       return Left(LoginFailure(e.toString()));

//       return right(LoginSuccess.fromJson(response));
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServiecesFailure.fromDioError(e));
//       }
//       return left(ServiecesFailure(e.toString()));
//     }

// }
// }

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/core/domain/services/api.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/feature/auth/login/data/repo/login_repo.dart';

import '../../manger/login_cubit/login_state.dart';

class LoginRepoImp implements LoginRepo {
  final ApiServices api;

  LoginRepoImp(this.api);

  @override
  Future<Either<Failure, LoginSuccess>> loginData(
      String username, String password) async {
    try {
      var requestBody = {
        "username": username,
        "password": password,
      };
      var response = await api.post(Confg.loginUrl, body: requestBody);
      return right(LoginSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
}
