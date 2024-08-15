import 'dart:io';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:dio/dio.dart';

// class FillWalletRequestModel {
//   final File file;
//   final String amount;

//   FillWalletRequestModel({required this.file, required this.amount});

//   Future<FormData> toFormData() async {
//     return FormData.fromMap({
//       'file': await MultipartFile.fromFile(file.path, filename: 'wallet_image.png'),
//       'amount': amount,
//     });
//   }
// }


import 'package:dio/dio.dart';

class FillWalletRequestModel {
  final File image;
  final String amount;

  FillWalletRequestModel({required this.image, required this.amount});

  // Future<FormData> toFormData() async {
  //   return FormData.fromMap({
  //     'image': await MultipartFile.fromFile(image.path),
  //     'amount': amount,
  //   });
  // }

Future<FormData> toFormData() async {
  return FormData.fromMap({
    'image': await MultipartFile.fromFile(image.path, ),
    'amount': amount,
  });
}
}
