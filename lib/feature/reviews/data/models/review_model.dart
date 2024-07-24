import 'package:flutter/cupertino.dart';

class ReviewModel{
  final ImageProvider? image;
  final String userName;
  final String review;
  final double rate;
  final DateTime reviewedAt;

  ReviewModel( {required this.userName, required this.review, required this.rate, required this.reviewedAt, this.image});
}