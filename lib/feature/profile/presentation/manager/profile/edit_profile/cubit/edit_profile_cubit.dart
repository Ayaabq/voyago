import 'package:bloc/bloc.dart';
import 'package:voyago/feature/profile/data/models/edit_user_model.dart';
import 'package:voyago/feature/profile/data/repo/profile_repo.dart';
import 'package:voyago/feature/profile/presentation/manager/profile/edit_profile/cubit/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EidtProfileState> {
  final ProfileRepo editProfileRepo;

  EditProfileCubit(this.editProfileRepo) : super(EditProfileInl());

  Future<void> featchEdit(EditUser model) async {
    emit(EditProfileStateLoading());

    var result = await editProfileRepo.editUser(
       model);

    result.fold(
      (failure) => emit(EditProfileStateFailure(failure.errMessage)),
      (success) => emit(EditProfileStateSuccess(success.message)),
    );
  }
}
