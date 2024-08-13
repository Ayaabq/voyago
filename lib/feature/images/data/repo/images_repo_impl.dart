import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/images/data/repo/images_repo.dart';
import 'package:voyago/feature/images/presentation/manager/all_images_cubit/images_state.dart';
import 'package:voyago/feature/images/presentation/manager/images_state.dart';

import '../../../../core/domain/services/api.dart';

class ImagesRepoImpl extends ImagesRepo{
  final ApiServices api;

  ImagesRepoImpl({required this.api});
  @override
  Future<Either<Failure, ImageSuccess>> getImage(String url, int id) async{
    try {
      var response = await api.get(url+id.toString(), hasToken: true);

      return right(ImageSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AllImageSuccess>> getAllImage(String url, int id) async {
    try {
      var response = await api.get(url+id.toString(), hasToken: true);

      return right(AllImageSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }
  
}