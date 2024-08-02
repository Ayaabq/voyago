// 


import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:voyago/feature/profile/data/models/profile_model.dart';
import 'package:voyago/feature/profile/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  Future<void> fetchProfile() async {
    emit(ProfileLoading());

    var result = await profileRepo.getProfile();
    result.fold(
      (failure) {
        emit(ProfileFailure(failure.errMessage));
      },
      (profile) {
        emit(ProfileSuccess(profile));
      },
    );
  }
}
