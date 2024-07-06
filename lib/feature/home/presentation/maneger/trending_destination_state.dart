import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:voyago/feature/home/data/models/destination_model.dart';

abstract class TrendingDestinationState {}

class TrendingDestinationInitial extends TrendingDestinationState {}

class TrendingDestinationLoading extends TrendingDestinationState {}

class TrendingDestinationSuccess extends TrendingDestinationState {
  final List<DestinationModel> destinationModels;

  TrendingDestinationSuccess(this.destinationModels);

  static TrendingDestinationSuccess fromJson(Map<String, dynamic> response) {
    final destinations=( response['data']['result'] as List).
    map((e)
          => DestinationModel.fromJson(e)).toList();
    return TrendingDestinationSuccess(
     destinations
    );
  }
}

class TrendingDestinationFailure extends TrendingDestinationState {
  final String errorMessage;
  TrendingDestinationFailure(this.errorMessage);

  static TrendingDestinationFailure fromJson(Map<String, dynamic> response) {
    return TrendingDestinationFailure(response['err'] ?? 'Unknown error');
  }
}
