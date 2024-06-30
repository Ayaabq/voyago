// // part of 'register_cubit.dart';

// // @immutable
// // sealed class RegisterState {}

// // final class RegisterInitial extends RegisterState {}

// // final class RegisterLoading extends RegisterState {}

// // final class RegisterSuccess extends RegisterState {
// //   final String messageSucess;

// //   RegisterSuccess(this.messageSucess);

// //   static RegisterSuccess fromJson(Map<String, dynamic> response) {}
// // }

// // final class RegisterFailure extends RegisterState {
// //   final String errMessage;

// //   RegisterFailure(this.errMessage);
// // }
// abstract class RegisterState {}

// class RegisterInitial extends RegisterState {}

// class RegisterLoading extends RegisterState {}

// class RegisterSuccess extends RegisterState {
//   final String message;
//   RegisterSuccess(this.message);

//  // static RegisterSuccess fromJson(Map<String, dynamic> response) {}

//  // static RegisterSuccess fromJson(Map<String, dynamic> response) {}

//  // static RegisterSuccess (Map<String, dynamic> response) {

//   }

// class RegisterFailure extends RegisterState {
//   final String errorMessage;
//   RegisterFailure(this.errorMessage);
// }

//8888
// abstract class RegisterState {}

// class RegisterInitial extends RegisterState {}

// class RegisterLoading extends RegisterState {}

// class RegisterSuccess extends RegisterState {
//   final String message;
//   RegisterSuccess(this.message);

//   static RegisterSuccess fromJson(Map<String, dynamic> response) {
//     return RegisterSuccess.fromJson(response);
//   }
// }

// class RegisterFailure extends RegisterState {
//   final String errorMessage;
//   RegisterFailure(this.errorMessage);
// }

//test new
import 'package:voyago/feature/auth/register/data/models/register_model.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String message;
  
  RegisterSuccess(this.message, );

  static RegisterSuccess fromJson(Map<String, dynamic> response) {
    return RegisterSuccess(response['msg'],);
  }
}

class RegisterFailure extends RegisterState {
  final String errorMessage;
  RegisterFailure(this.errorMessage);
}
