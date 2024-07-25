// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:voyago/destination/errors/failure.dart';
// import 'package:voyago/destination/utils/api.dart';
// import 'package:voyago/destination/utils/confg.dart';
// import 'package:voyago/feature/auth/register/data/models/register_model.dart';
// import 'package:voyago/feature/auth/register/data/weather_repo/register_repo.dart';
// import 'package:voyago/feature/auth/register/presitions/manger/register_cubit/register_cubit.dart';
// import 'package:voyago/feature/auth/register/presitions/manger/register_cubit/register_state.dart';

// class RegisterRepoImp implements RegisterRepo {
//   final Api api;

//   RegisterRepoImp(this.api);

//   @override
//   Future<Either<Failure, RegisterSuccess>> registerData(String userName, String email, String password, String confirmPassword) async {
//     try {
//       var response = await api.post(
//         endPoint: Confg.registerUrl,
//         body: {
//           "username": userName,
//           "email": email,
//           "password": password,
//           "confirm_password": confirmPassword,
//         },
//       );

//       return right(RegisterSuccess().message);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServiecesFailure.fromDioError(e));
//       }
//       return left(ServiecesFailure(e.toString()));
//     }
//   }
// }
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/core/domain/services/api.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/feature/auth/register/data/repo/auth_register_repo.dart';
import 'package:voyago/feature/auth/register/presentation/manger/register_cubit/register_state.dart';
import 'package:voyago/feature/forgot_password/presentation/manger/fprgot_pass/forgotPasswordCubit/forgot_password_cubit.dart';

import '../../../../forgot_password/data/models/email_verification_model.dart';
import '../../../../forgot_password/presentation/manger/codeForgotPass/code_forgot_password_cubit.dart';
import '../../../../forgot_password/presentation/manger/restPassword/rest_password_cubit.dart';
import '../../presentation/manger/verifcation_cubits/verification_state.dart';
import '../models/verification_model.dart';

class AuthRepoImp implements AuthRepo {
  final ApiServices api;

  AuthRepoImp(this.api);

//    ****             Register          ***///////
  @override
  Future<Either<Failure, RegisterSuccess>> registerData(String username,
      String email, String password, String confirmPassword) async {
    try {
      var requestBody = {
        "username": username,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
      };
      print('Request Body: $requestBody');
      var response = await api.post(Confg.registerUrl, body: requestBody);

      String correctCode = response['data']['correct_code'];
      print(correctCode);
      return right(RegisterSuccess.fromJson(response, correctCode));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

//***            register code verification     ***//////////
////////////////////////////////////////////////////////////
  @override
  Future<Either<Failure, VerificationSuccess>> verifyCode(
      VerificationModel model) async {
    try {
      var requestBody = {
        "correct_code": model.correctCode,
        "in_code": model.inCode,
        "username": model.username,
        "email": model.email,
        "password": model.password,
        "confirm_password": model.confirmPassword,
      };
      print('Request Body: $requestBody');
      var response = await api.post(Confg.registerCode, body: requestBody);

      return right(VerificationSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  @override
  // Future<Either<Failure, LoginSuccess>> login(LoginModel loginModel) async {
  //   try {
  //     var requestBody = {
  //       "username": loginModel.username,
  //       "password": loginModel.password,
  //     };
  //     print('Request Body: $requestBody');
  //     var response = await api.post(Confg.loginUrl, body: requestBody);

  //     return right(LoginSuccess.fromJson(response));
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServiecesFailure.fromDioError(e));
  //     }
  //     return left(ServiecesFailure(e.toString()));
  //   }
  // }

/////////////////////////////////////////////////
// ****    forgot password only email   ****/////
  @override
  Future<Either<Failure, ForgotPasswordSuccess>> forgotPassword(
      String email) async {
    try {
      var requestBody = {
        "email": email,
      };
      print('Request Body: $requestBody');
      var response = await api.post(Confg.forgotPasswordUrl, body: requestBody);

      print(response);
      return right(ForgotPasswordSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  @override
//     ****    code forgot password       ****////
//////////////////////////////////////////////////
  Future<Either<Failure, CodeForgotPasswordSuccess>>
      verificationCodeForgotpassword(Email model) async {
    print(model);
    try {
      var requestBody = {"email": model.email, "cod": model.inCode};
      print('Request Body: $requestBody');
      var response = await api.post(Confg.checkcverificationCodeForgotpass,
          body: requestBody);

      print(response);
      return right(CodeForgotPasswordSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

////////////////////////////////////////////////////
////////////////////////////////////////////////////
// *****     rest password            ***///////////
  @override
  Future<Either<Failure, RestPasswordSuccess>> restPassword(
      String email, String password) async {
    try {
      var requestBody = {"email": email, "password": password};
      print('Request Body: $requestBody');
      var response = await api.post(Confg.restPasswordUrl, body: requestBody);

      print(response);
      return right(RestPasswordSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
}
