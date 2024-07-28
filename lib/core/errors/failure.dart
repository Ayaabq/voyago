import 'dart:convert';

import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class ServiecesFailure extends Failure {
  ServiecesFailure(super.errMessage);

  factory ServiecesFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServiecesFailure('Connection Timeout with Server');
      case DioExceptionType.sendTimeout:
        return ServiecesFailure('Sended Timeout with Server');
      case DioExceptionType.receiveTimeout:
        return ServiecesFailure('Receive Timeout with Server');
      case DioExceptionType.badCertificate:
        return ServiecesFailure('Bad Requset Timeout with Server');
      case DioExceptionType.badResponse:
        return ServiecesFailure.fromJson(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServiecesFailure('Request to Server was canceled');
      case DioExceptionType.connectionError:
        return ServiecesFailure('No Internet Connection ');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServiecesFailure('No internet connection');
        }
        return ServiecesFailure('unknown error , Try again');

      default:
        return ServiecesFailure('Opps ther was an Error , Please try again');
    }
  }

  factory ServiecesFailure.fromJson(dynamic statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 406) {
    Map<String, dynamic> data = jsonDecode(response);
    
      return ServiecesFailure(data['err']);

    } else if (statusCode == 500) {
      return ServiecesFailure('INternal server Error , Please try later');
    } else if (statusCode == 404) {
      return ServiecesFailure('Method not found , Please try later');
    } else if (statusCode == 403) {
      return ServiecesFailure(' Forbidden , Please try later');
    } else if (statusCode == 406) {
      return ServiecesFailure('406, Please try later');
    } else {
      return ServiecesFailure('Opps ther was an Error , Please try again');
    }
  }
}
