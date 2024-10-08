import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/profile/data/models/profile_model.dart';
import 'package:voyago/feature/profile/data/models/user_model.dart';

import '../../presentation/manager/profile/edit_profile/cubit/edit_profile_state.dart';
import '../models/edit_user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileModel>> getProfile();
  Future<Either<Failure, UserModel>> getUser();
  Future<Either<Failure, EditProfileStateSuccess>> editUser(EditUser usermodel );
}
