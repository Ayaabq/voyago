

import 'package:equatable/equatable.dart';

abstract class ProfilePictureState extends Equatable {
  const ProfilePictureState();

  @override
  List<Object?> get props => [];
}

class ProfilePictureInitial extends ProfilePictureState {}

class ProfilePictureUploading extends ProfilePictureState {}

class ProfilePictureUploaded extends ProfilePictureState {}

class ProfilePictureUploadError extends ProfilePictureState {
  final String errorMessage;

  const ProfilePictureUploadError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
