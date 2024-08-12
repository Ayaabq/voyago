abstract class EidtProfileState {}

class EditProfileInl extends EidtProfileState {}

class EditProfileStateLoading extends EidtProfileState {}



class EditProfileStateSuccess extends EidtProfileState {
  final String message;
  

  EditProfileStateSuccess(this.message, );

  static EditProfileStateSuccess fromJson(Map<String, dynamic> response) {
    return EditProfileStateSuccess(response['msg']);
  }
}


class EditProfileStateFailure extends EidtProfileState {
  final String errorMessage;
  EditProfileStateFailure(this.errorMessage);

static EditProfileStateFailure fromJson(Map<String, dynamic> response) {
    return EditProfileStateFailure(response['err'],);
  }
}
