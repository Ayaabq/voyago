// import 'package:dartz/dartz.dart';
// import 'package:voyago/feature/profile/presentation/manager/profile/profile_main/profile_cubit.dart';

// import '../../../../core/errors/failure.dart';

// abstract class ProfileRepo{

// Future<Either<Failure, ProfileSuccess>>
//   getProfile();


// Future<Either<Failure, ProfileSuccess>>
//   getInfoProfile();
// }



import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/profile/data/models/profile_model.dart';
import 'package:voyago/feature/profile/data/models/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileModel>> getProfile();
  Future<Either<Failure, UserModel>> getUser();
}
