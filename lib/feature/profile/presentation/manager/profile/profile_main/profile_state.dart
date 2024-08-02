// part of 'profile_cubit.dart';

// abstract class ProfileState {}

// class ProfileInitial extends ProfileState {}

// class ProfileLoading extends ProfileState {}

// class ProfileSuccess extends ProfileState {
//   final String name;
//   final String email;

//   ProfileSuccess(this.name, this.email);
//   static ProfileSuccess fromJson(Map<String, dynamic> response) {
//     return ProfileSuccess(
//       response["data"]['email'],
//       response['data']['name'],
//     );
//   }
// }

// class ProfileFialure extends ProfileState {
//   final String errorMessage;
//   ProfileFialure(this.errorMessage);

//   static ProfileFialure fromJson(Map<String, dynamic> response) {
//     return ProfileFialure(response['err'] ?? 'Unknown error');
//   }
// }


part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfileModel profile;

  ProfileSuccess(this.profile);
}

class ProfileFailure extends ProfileState {
  final String errorMessage;

  ProfileFailure(this.errorMessage);
}
