import 'package:bloc/bloc.dart';

import '../../../../auth/register/data/repo/auth_register_repo.dart';

part 'rest_password_state.dart';

class RestPasswordCubit extends Cubit<RestPasswordState> {
  RestPasswordCubit(this.registerRepo) : super(RestPasswordInitial());
  final AuthRepo registerRepo;

  Future<void> featchRestPassword(String email, String password) async {
    emit(RestPasswordLoading());

    var result = await registerRepo.restPassword(email, password);

    result.fold(
      (failure) => emit(RestPasswordFailure(failure.errMessage)),
      (success) => emit(RestPasswordSuccess(success.message)),
    );
  }
}
