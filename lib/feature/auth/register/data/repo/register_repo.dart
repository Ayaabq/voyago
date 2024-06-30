import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/auth/register/data/models/register_model.dart';
import 'package:dartz/dartz.dart';


// abstract class RegisterRepo {
//   Future<Either<Failure, RegisterModel>> registerData(String userName ,String email,String password, String confermPasword);
// // Future<Either<Failure, String>> registerData();
//  }
// // respone 200 
import 'package:dartz/dartz.dart';
import 'package:voyago/feature/auth/register/presitions/manger/register_cubit/register_cubit.dart';
import 'package:voyago/feature/auth/register/presitions/manger/register_cubit/register_state.dart';

abstract class RegisterRepo {
  Future<Either<Failure, RegisterSuccess>> registerData(String username, String email, String password, String confirmPassword);
}
