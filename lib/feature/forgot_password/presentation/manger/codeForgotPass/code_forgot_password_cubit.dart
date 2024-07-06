import 'package:bloc/bloc.dart';

import '../../../../auth/register/data/repo/auth_register_repo.dart';
import '../../../data/models/email_verification_model.dart';

part 'code_forgot_password_state.dart';

class CodeForgotPasswordCubit extends Cubit<CodeForgotPasswordState> {
  CodeForgotPasswordCubit(this.registerRepo)
      : super(CodeForgotPasswordInitial());

  final AuthRepo registerRepo;

  Future<void> featchCodeForgotPassword(Email model) async {
    emit(CodeForgotPasswordLoading());

    var result = await registerRepo.verificationCodeForgotpassword(model);

    result.fold(
      (failure) => emit(CodeForgotPasswordFailure(failure.errMessage)),
      (success) => emit(CodeForgotPasswordSuccess(success.message)),
    );
  }
}
