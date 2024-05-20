import 'package:dio/dio.dart';

class Api {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;
  Api(this._dio);
}
