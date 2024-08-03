// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:voyago/core/errors/failure.dart';
// import 'package:voyago/core/utils/confg.dart';
// import 'package:voyago/feature/profile/data/repo/profile_repo.dart';
// import 'package:voyago/feature/profile/presentation/manager/profile/profile_main/profile_cubit.dart';

// import '../../../../core/domain/services/api.dart';

// class ProfileRepoImpl implements ProfileRepo {
//   final ApiServices api;

//   ProfileRepoImpl(this.api);
//   @override

// //**       profile main                     *** */
//   Future<Either<Failure, ProfileSuccess>> getProfile() async {
//     try {
//       var response = await api.get(Confg.profileMain, hasToken: true);
//       return right(ProfileSuccess.fromJson(response));
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServiecesFailure.fromDioError(e));
//       }
//       return left(ServiecesFailure(e.toString()));
//     }
//   }

// //********       info profile                       *********//////

//  @override
//   Future<Either<Failure, ProfileSuccess>> getInfoProfile() {

//     throw UnimplementedError();
//   }

// }

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/feature/profile/data/repo/profile_repo.dart';
import 'package:voyago/feature/profile/data/models/profile_model.dart';

import '../../../../core/domain/services/api.dart';
import '../models/user_model.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiServices api;

  ProfileRepoImpl(this.api);

  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      var response = await api.get(Confg.profileMain, hasToken: true);
      return right(ProfileModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

////*******        info prfile                ****** */
  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      var response = await api.get(Confg.profileInfo, hasToken: true);
      return right(UserModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
}
