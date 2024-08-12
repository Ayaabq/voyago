
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/feature/place/data/models/place_model.dart';



abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageSuccess extends ImageState {
  final String? image;

  ImageSuccess( this.image);

  static ImageSuccess fromJson(Map<String, dynamic> response) {
    // print(response['data']['firstImage']['url']);
    if(response['data']['firstImage'] !=null){
      final String image = response['data']['firstImage']['url'];
      return ImageSuccess(image);
    }else {
      return ImageSuccess(null);
    }
  }
}


class ImageFailure extends ImageState {
  final String errorMessage;
  ImageFailure(this.errorMessage);

  static ImageFailure fromJson(Map<String, dynamic> response) {
    return ImageFailure(response['err'] ?? 'Unknown error');
  }



}