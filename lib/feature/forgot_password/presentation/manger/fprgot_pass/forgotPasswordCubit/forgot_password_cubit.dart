import 'package:bloc/bloc.dart';

import '../../../../../auth/register/data/repo/auth_register_repo.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.registerRepo) : super(ForgotPasswordInitial());

  final AuthRepo registerRepo;

  Future<void> featchForgotPassword(String email) async {
    emit(ForgotPasswordLoading());

    var result = await registerRepo.forgotPassword(email);

    result.fold(
      (failure) => emit(ForgotPasswordFailure(failure.errMessage)),
      (success) => emit(ForgotPasswordSuccess(success.message)),
    );
  }
}
