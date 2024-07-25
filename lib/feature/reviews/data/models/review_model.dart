import 'package:flutter/cupertino.dart';

class ReviewModel {
  final ImageProvider? image;
  final String? userName;
  final String? review;
  final num? rate;
  final DateTime? reviewedAt;

  ReviewModel({
    this.userName,
    this.review,
    this.rate,
    this.reviewedAt,
    this.image,
  });

  // Factory constructor to create a ReviewModel from JSON
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      userName: json['username'] as String?,
      review: json['comment'] as String?,
      rate: json['rate'] != null ? json['rate'] as num : null,
      reviewedAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      image: null, // Handle image separately as it's not in the provided JSON
    );
  }

  // Method to convert a ReviewModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'username': userName,
      'comment': review,
      'rate': rate?.toString(),
      'createdAt': reviewedAt?.toIso8601String(),
      // Image is not included in the JSON representation
    };
  }
}
