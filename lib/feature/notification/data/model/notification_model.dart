import 'package:flutter/material.dart';

class NotificationModel {
  final int id;
  final String title;
  final String body;
  final DateTime time;

  const NotificationModel(
      {
        required this.id,
        required this.time,
        required this.title,
    required this.body,
  });

// "id": 1,
// "title": "crediting",
// "body": "Your requist is pending ... we will respond as soon as!",
// "type": "wallet",
// "ID_Type": null,
// "createdAt": "2024-08-05T21:36:48.000Z",
// "updatedAt": "2024-08-05T21:36:48.000Z",
// "UserId": 1

  // Factory constructor to create a Destination object from JSON
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        title:json['title'],
        body: json['body'],
        id: json['id'],
        time: DateTime.parse(json['createdAt'])

    );
  }

}