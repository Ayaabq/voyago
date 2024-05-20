import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/auth/register/data/models/register_model.dart';
import 'package:dartz/dartz.dart';


abstract class RegisterRepo {
  Future<Either<Failure, RegisterModel>> registerData();
}
