import 'package:flutter/cupertino.dart';

class ReviewModel {
  final double rating;
  final String userName;
  final DateTime submittedAt;
  final String comment;
  final ImageProvider userImage;

  ReviewModel(
      {required this.rating,
      required this.userName,
      required this.submittedAt,
      required this.comment,
      required this.userImage});
}
