import 'package:flutter/cupertino.dart';

class ReviewModel {
  final ImageProvider? image;
  final String userName;
  final String? review;
  final num? rate;
  final DateTime reviewedAt;

  ReviewModel({
    required this.userName,
    this.review,
    this.rate,
    required this.reviewedAt,
    this.image,
  });

  // Factory constructor to create a ReviewModel from JSON
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      userName: json['username'] as String,
      review: json['comment'] as String?,
      rate: json['rate'] != null ? json['rate'] : null,
      reviewedAt:  DateTime.parse(json['createdAt']) ,
      image: null, // Handle image separately as it's not in the provided JSON
    );
  }

  // Method to convert a ReviewModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'username': userName,
      'comment': review,
      'rate': rate?.toString(),
      'createdAt': reviewedAt.toIso8601String(),
      // Image is not included in the JSON representation
    };
  }
}
// "id": 1,
// "comment": "KKK",
// "rate": 1,
// "createdAt": "2024-07-24T23:02:01.000Z",
// "updatedAt": "2024-07-24T23:02:01.000Z",
// "TripId": 1,
// "UserId": 1,
// "DestenationId": null,
// "AttractionId": null,
// "username": "Aya sareej"