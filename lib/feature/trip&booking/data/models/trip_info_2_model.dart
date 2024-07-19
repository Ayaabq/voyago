
import 'feature_model.dart';

class TripInfo2Model {
  final int duration;
  final DateTime startDate;
  final int capacity;
  final int available;
  final int attractions;
  final List<Feature> features;
  final String meetPoint;
  final String description;
  final int timeCancellation;

  TripInfo2Model({
    required this.duration,
    required this.startDate,
    required this.capacity,
    required this.available,
    required this.attractions,
    required this.features,
    required this.meetPoint,
    required this.timeCancellation,
    required this.description
  });

  factory TripInfo2Model.fromJson(Map<String, dynamic> json) {
    return TripInfo2Model(
      duration: json['duration'],
      startDate: DateTime.parse(json['start_date']),
      capacity: json['capacity'],
      available: json['available'],
      attractions: json['ATTRACTIONS'],
      features: List<Feature>.from(json['features'].map((x) => Feature.fromJson(x))),
      meetPoint: json['meet_point'],
      timeCancellation: json['time_canellation'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'duration': duration,
      'start_date': startDate.toIso8601String(),
      'capacity': capacity,
      'available': available,
      'ATTRACTIONS': attractions,
      'features': List<dynamic>.from(features.map((x) => x.toJson())),
      'meet_point': meetPoint,
      'time_canellation': timeCancellation,
      'description':description
    };
  }
}

