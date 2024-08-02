import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../../data/repo/profile_repo.dart';
import 'info_profile_state.dart';



class UserCubit extends Cubit<UserState> {
 final ProfileRepo profileRepo;

  UserCubit(this.profileRepo) : super(UserInitial());

  Future<void> fetchUser() async {
    emit(UserLoading());

    var result = await profileRepo.getUser();
    result.fold(
      (failure) {
        emit(UserFailure(failure.errMessage));
      },
      (user) {
        emit(UserSuccess(user));
      },
    );
  }
}

