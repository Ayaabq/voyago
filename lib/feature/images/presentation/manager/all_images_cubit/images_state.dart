
import 'package:voyago/core/utils/assets.dart';
import 'package:voyago/feature/place/data/models/place_model.dart';



abstract class AllImageState {}

class AllImageInitial extends AllImageState {}

class AllImageLoading extends AllImageState {}

class AllImageSuccess extends AllImageState {
  final List<String> images;

  AllImageSuccess( this.images);

  static AllImageSuccess fromJson(Map<String, dynamic> response) {
    final List images=response['data']['images'];
    return AllImageSuccess(images.map((e){
      return e['url'] as String;
    }).toList());
  }
}


class AllImageFailure extends AllImageState {
  final String errorMessage;
  AllImageFailure(this.errorMessage);

  static AllImageFailure fromJson(Map<String, dynamic> response) {
    return AllImageFailure(response['err'] ?? 'Unknown error');
  }



}