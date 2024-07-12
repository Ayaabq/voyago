// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:voyago/destination/utils/confg.dart';

// class Api {
//   final base = Confg.mobileUrl;
//   final Dio _dio;
//   Api(this._dio);

//   Future<Map<String, dynamic>> get({required String endPoint}) async {
//     var response = await _dio.get('$base$endPoint');

//     return response.data;
//   }

//   Future<Map<String, dynamic>> post({
//     required String endPoint,
//     required Map<String, dynamic> body,
//   }) async {
//     var response = await _dio.post(
//       '$base$endPoint',
//       data: body,
//     );
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       print(response.statusCode);
//       Map<String, dynamic> data = jsonDecode(response.data);
//       return data;
//     } else {
//       throw Exception(
//           'there is a promlem with status code ${response.statusCode} with body ${jsonDecode(response.data)}');
//     }
//   }
// }
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

//import 'package:http/http.dart' as http;
abstract class ApiServices {
  Future<dynamic> get(String path,
      {Map<String, String>? queryParams, bool? hasToken});

  Future post(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    FormData? formData,
    bool? hasToken,
  });

  // Future reqHttp(BuildContext context,String path,
  //     {Map<String, dynamic>? queryParams,
  //       Map<String, String> body=const {},
  //       String typeRequest="POST",
  //       String? key,
  //       List<http.MultipartFile> multipartFile=const[],bool? hasToken});

  // Future postFiles(
  //   BuildContext context,
  //   String path, {
  //   Map<String, dynamic>? queryParams,
  //   Map<String, dynamic>? body,
  //   FormData? formData,
  //   String? key,
  //   bool? hasToken,
  // });

  Future postList(
    String path, {
    Map<String, String>? queryParams,
    List<dynamic>? body,
    FormData? formData,
    bool? hasToken,
  });
  Future put(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    FormData? formData,
    bool? hasToken,
  });
  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
    bool? hasToken,
  });
}
