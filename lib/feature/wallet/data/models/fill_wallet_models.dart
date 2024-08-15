import 'dart:io';

import 'package:dio/dio.dart';

class FillWalletRequestModel {
  final File file;
  final String amount;

  FillWalletRequestModel({required this.file, required this.amount});

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path, filename: 'wallet_image.png'),
      'amount': amount,
    });
  }
}
