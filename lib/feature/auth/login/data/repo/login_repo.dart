import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';

import '../../manger/login_cubit/login_state.dart';

abstract class LoginRepo {
 // Future<Either<Failure, LoginSuccess>> login(LoginModel loginModel);
Future<Either<Failure, LoginSuccess>> loginData(String username, String password);
}
