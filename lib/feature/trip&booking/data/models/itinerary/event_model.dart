import 'package:intl/intl.dart';

class EventModel {
  final int id;
  final String action;
  final String title;
  final DateTime startDate;
  final double duration;
  final String description;
  final String type;
  final double? priceAdult;
  final double? priceChild;
  final String additionalNote;
  final int dayTripId;
  final int? attractionId;

  EventModel({
    required this.id,
    required this.action,
    required this.title,
    required this.startDate,
    required this.duration,
    required this.description,
    required this.type,
    this.priceAdult,
    this.priceChild,
    required this.additionalNote,
    required this.dayTripId,
    this.attractionId,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      action: json['action'],
      title: json['title']??"",
      startDate: DateFormat('dd-MM-yyyy').parse(json['start_date']),
      duration: json['duration'].toDouble(),
      description: json['description'],
      type: json['type'],
      priceAdult: json['price_adult']?.toDouble(),
      priceChild: json['price_child']?.toDouble(),
      additionalNote: json['additional_note'],
      dayTripId: json['DayTripId'],
      attractionId: json['AttractionId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'action': action,
      'title': title,
      'start_date': startDate.toIso8601String(),
      'duration': duration,
      'description': description,
      'type': type,
      'price_adult': priceAdult,
      'price_child': priceChild,
      'additional_note': additionalNote,
      'DayTripId': dayTripId,
      'AttractionId': attractionId,
    };
  }
}
