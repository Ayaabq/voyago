// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:voyago/feature/auth/register/data/repo/register_repo.dart';

// import '../../../data/models/verification_model.dart';
// import 'verification_state.dart';

// class VerificationCubit extends Cubit<VerificationState> {
//   final RegisterRepo verificationRepo;

//   VerificationCubit(this.verificationRepo) : super(VerificationInitial());

//   Future<void> verify(VerificationModel verificationModel) async {
//     emit(VerificationLoading());
//     var result = await verificationRepo.verifyData(
//       verificationModel.correctCode,
//       verificationModel.inCode,
//       verificationModel.username,
//       verificationModel.email,
//       verificationModel.password,
//       verificationModel.confirmPassword,
//     );

//     result.fold(
//       (failure) => emit(VerificationFailure(failure.errMessage)),
//       (success) => emit(VerificationSuccess(success.message)),
//     );
//   }
// }

// import 'package:bloc/bloc.dart';
// import 'package:voyago/feature/auth/register/data/repo/register_repo_imp.dart';
// import 'package:voyago/feature/auth/register/presitions/manger/verifcation_cubits/verification_state.dart';

// import '../../../data/models/verification_model.dart';

// class VerificationCubit extends Cubit<VerificationState> {
//   final RegisterRepoImp verificationRepo;

//   VerificationCubit(this.verificationRepo) : super(VerificationInitial());

//   Future<void> verify(VerificationModel verificationModel) async {
//     emit(VerificationLoading());

//     var result = await verificationRepo.verifyData(
//       verificationModel.correctCode,
//       verificationModel.inCode,
//       verificationModel.username,
//       verificationModel.email,
//       verificationModel.password,
//       verificationModel.confirmPassword,
//     );

//     result.fold(
//       (failure) => emit(VerificationFailure(failure.errMessage)),
//       (success) => emit(VerificationSuccess(success.message)),
//     );
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:voyago/feature/auth/register/data/repo/auth_register_repo_imp.dart';
import 'package:voyago/feature/auth/register/presentation/manger/verifcation_cubits/verification_state.dart';

import '../../../data/models/verification_model.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final AuthRepoImp verificationRepo;

  VerificationCubit(this.verificationRepo) : super(VerificationInitial());

  Future<void> verifyCode(VerificationModel model) async {
    emit(VerificationLoading());

    var result = await verificationRepo.verifyCode(model);
    print(result);
    result.fold(
      (failure) => emit(VerificationFailure(failure.errMessage)),
      (success) => emit(VerificationSuccess(success.message)),
    );
  }
}
