import 'package:voyago/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:voyago/feature/auth/register/presentation/manger/register_cubit/register_state.dart';
import 'package:voyago/feature/forgot_password/presentation/views/widgets/forgot_password_body.dart';

import '../../../../forgot_password/data/models/email_verification_model.dart';
import '../../../../forgot_password/presentation/manger/codeForgotPass/code_forgot_password_cubit.dart';
import '../../../../forgot_password/presentation/manger/fprgot_pass/forgotPasswordCubit/forgot_password_cubit.dart';
import '../../../../forgot_password/presentation/manger/restPassword/rest_password_cubit.dart';
import '../../presentation/manger/verifcation_cubits/verification_state.dart';
import '../models/verification_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, RegisterSuccess>> registerData(
      String username, String email, String password, String confirmPassword);

// code register verification   //

  Future<Either<Failure, VerificationSuccess>> verifyCode(
      VerificationModel model);

// forgot pass //

  Future<Either<Failure, ForgotPasswordSuccess>> forgotPassword(String email);

// verification code forgot password  //

  Future<Either<Failure, CodeForgotPasswordSuccess>>
      verificationCodeForgotpassword(Email model);

  // rest password   ///
  Future<Either<Failure, RestPasswordSuccess>> restPassword(
      String email, String password);
}
