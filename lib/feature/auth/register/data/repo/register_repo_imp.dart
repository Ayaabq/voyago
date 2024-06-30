// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:voyago/core/errors/failure.dart';
// import 'package:voyago/core/utils/api.dart';
// import 'package:voyago/core/utils/confg.dart';
// import 'package:voyago/feature/auth/register/data/models/register_model.dart';
// import 'package:voyago/feature/auth/register/data/repo/register_repo.dart';
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
import 'package:voyago/core/utils/api.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/feature/auth/register/data/models/register_model.dart';
import 'package:voyago/feature/auth/register/data/repo/register_repo.dart';
import 'package:voyago/feature/auth/register/presitions/manger/register_cubit/register_state.dart';

class RegisterRepoImp implements RegisterRepo {
  final Api api;

  RegisterRepoImp(this.api);

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
      var response = await api.post(
        endPoint: Confg.registerUrl,
        body: requestBody
    // {
    //       "username": username,
    //       "email": email,
    //       "password": password,
    //       "confirm_password": confirmPassword,
    //     },
      );
    
      return right(RegisterSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
}
