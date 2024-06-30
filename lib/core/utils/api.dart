import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:voyago/core/utils/confg.dart';

class Api {
  final base = Confg.mobileUrl;
  final Dio _dio;
  Api(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$base$endPoint');

    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> body,
  }) async {
    var response = await _dio.post(
      '$base$endPoint',
      data: body,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      Map<String, dynamic> data = jsonDecode(response.data);
      return data;
    } else {
      throw Exception(
          'there is a promlem with status code ${response.statusCode} with body ${jsonDecode(response.data)}');
    }
  }
}
