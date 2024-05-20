import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:voyago/core/utils/confg.dart';

class Api {
  final base = Confg.baseUrl;
  final Dio _dio;
  Api(this._dio);

Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$base$endPoint');

    return response.data;
  }


Future<Map<String, dynamic>> post({
    required String endPoint,
    required dynamic body,
  }) async {
    var response = await _dio.post(
      '$base$endPoint',
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.data);
      return data;
    } else {
      throw Exception(
          'there is a promlem with status code ${response.statusCode} with body ${jsonDecode(response.data)}');
    }
  }
}
