// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:meta/meta.dart';
// import 'package:voyago/destination/errors/failure.dart';
// import 'package:voyago/destination/utils/api.dart';
// import 'package:voyago/destination/utils/confg.dart';
// import 'package:voyago/feature/auth/register/data/models/register_model.dart';
// import 'package:voyago/feature/auth/register/data/weather_repo/register_repo.dart';
// import 'package:voyago/feature/auth/register/data/weather_repo/register_repo_imp.dart';

// part 'register_state.dart';

// class RegisterCubit extends Cubit<RegisterState> {
//   RegisterCubit( this.registerRepoImp) : super(RegisterInitial());

//   final RegisterRepoImp registerRepoImp;
//   String? username;
//   String? email;
//   String? password;
//   String? confpassword;

//   Future<void> featchRegister() async {
//    // emit(RegisterLoading());

//     var result = await registerRepoImp.registerData(
//         username.toString(), email.toString(), password.toString(), confpassword.toString());
//     result.fold((l) => {
// emit(RegisterFailure(l.errMessage))
// }, (r) => {emit(RegisterSuccess("success"))});

//     // var result =
//     // result.fold((failure) {
//     //   emit(RegisterFailure(failure.errMessage));
//     // }, (r) {
//     //   emit(RegisterSuccess(r));
//     // });
//   }
// }
// /*

// */
import 'package:bloc/bloc.dart';
import 'package:voyago/feature/auth/register/data/repo/auth_register_repo.dart';
import 'package:voyago/feature/auth/register/data/models/register_model.dart';
import 'package:voyago/feature/auth/register/presentation/manger/register_cubit/register_state.dart';

//888
// class RegisterCubit extends Cubit<RegisterState> {
//   final RegisterRepo registerRepo;

//   RegisterCubit(this.registerRepo) : super(RegisterInitial());

//   Future<void> featchRegister(
//       username, email, password, confirmPassword) async {
//     print(username + password);
//     emit(RegisterLoading());

//     var result = await registerRepo.registerData(
//         username, email, password, confirmPassword);

//     result.fold(
//       (failure) => emit(RegisterFailure(failure.errMessage)),
//       (success) => emit(RegisterSuccess(success.message)),
//     );
//   }
// }
//

///test new

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo registerRepo;

  RegisterCubit(this.registerRepo) : super(RegisterInitial());

  Future<void> featchRegister(RegisterModel registerModel) async {
    emit(RegisterLoading());

    var result = await registerRepo.registerData(
        registerModel.username,
        registerModel.email,
        registerModel.password,
        registerModel.confirmPassword);

    result.fold(
      (failure) => emit(RegisterFailure(failure.errMessage)),
      (success) => emit(RegisterSuccess(success.message, success.correctCode)),
    );
  }
}
