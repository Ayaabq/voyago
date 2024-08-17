import '../../attraction/data/models/attraction_model.dart';
import '../../destination/data/models/destination_model.dart';

class PersonalTripModel {
  String name;
  String notes;
  int duration;
  DateTime startDate;
  DestinationModel destination;
  List<AttractionModel> attractions;

  PersonalTripModel({
    required this.name,
    required this.notes,
    required this.duration,
    required this.startDate,
    required this.destination,
    required this.attractions,
  });

  // Factory constructor to create a PersonalTripModel object from JSON
  factory PersonalTripModel.fromJson(Map<String, dynamic> json, DestinationModel destination, List<AttractionModel> attractions) {
    return PersonalTripModel(
      name: json['name'],
      notes: json['notes'],
      duration: json['duration'],
      startDate: DateTime.parse(json['start_date']),
      destination: destination,
      attractions: attractions,
    );
  }

  // Method to convert a PersonalTripModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'notes': notes,
      'duration': duration,
      'start_date': startDate.toIso8601String(),
      'DestenationId': destination.id,
      'attractions': attractions.map((attraction) => attraction.id).toList(),
    };
  }
}
