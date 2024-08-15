import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:voyago/core/utils/confg.dart';
import 'package:voyago/core/utils/storge_token.dart';
import 'package:voyago/feature/profile/imagess/img_state.dart';

class ProfilePictureCubit extends Cubit<ProfilePictureState> {
  ProfilePictureCubit() : super(ProfilePictureInitial());

  Future<void> uploadProfilePicture(File image) async {
    emit(ProfilePictureUploading());

    try {
      // إعداد Dio
      Dio dio = Dio();
      String url = "${Confg.mobileApiUrl}/add_profile_pic"; // عدل URL هنا

      // إعداد البيانات لإرسالها
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(image.path,
            filename: "profile_image.png"),
      });

      // إرسال الطلب
      var response = await dio.post(url, data: formData);

      if (response.statusCode == 200) {
        emit(ProfilePictureUploaded());
      } else {
        emit(const ProfilePictureUploadError("Failed to upload image"));
      }
    } catch (e) {
      emit(ProfilePictureUploadError("An error occurred: $e"));
    }
  }
}
