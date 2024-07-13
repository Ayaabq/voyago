// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:meta/meta.dart';
// import 'package:voyago/destination/errors/failure.dart';
// import 'package:voyago/destination/utils/api.dart';
// import 'package:voyago/destination/utils/confg.dart';
// import 'package:voyago/feature/auth/register/data/models/register_model.dart';
// import 'package:voyago/feature/auth/register/data/repo/register_repo.dart';
// import 'package:voyago/feature/auth/register/data/repo/register_repo_imp.dart';

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
// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'sign_up_data.dart'; // افترض أن ملف SignUpData يحتوي على الكود الخاص بك
// import 'failure.dart'; // افترض أن ملف Failure يحتوي على الكود الخاص بك

// // Auth States
// abstract class AuthState {}

// class AuthInitial extends AuthState {}

// class AuthLoading extends AuthState {}

// class AuthSuccess extends AuthState {
//   final String message;

//   AuthSuccess(this.message);
// }

// class AuthError extends AuthState {
//   final String error;

//   AuthError(this.error);
// }

// // Auth Cubit
// class AuthCubit extends Cubit<AuthState> {
//   final Dio dio;

//   AuthCubit(this.dio) : super(AuthInitial());

//   Future<void> signUp(SignUpData signUpData) async {
//     emit(AuthLoading());
//     try {
//       final response = await dio.post(
//         'https://yourapi.com/signup', // ضع هنا رابط API المناسب
//         data: signUpData.toJson(),
//       );

//       if (response.statusCode == 200) {
//         String message = response.data['message'];
//         emit(AuthSuccess(message));
//       } else {
//         emit(AuthError('Sign Up Failed'));
//       }
//     } on DioException catch (e) {
//       final failure = ServiecesFailure.fromDioError(e);
//       emit(AuthError(failure.errMessage));
//     } catch (e) {
//       emit(AuthError(e.toString()));
//     }
//   }
// }

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
