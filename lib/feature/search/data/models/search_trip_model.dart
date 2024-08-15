class TripSearchModel {
  final int id;
  final String name;
  final String description;
  final double tripPrice;
  final DateTime endDate;
  final int capacity;
  final bool available;
  final DateTime startDate;
  final String? guide;
  final String? meetingPointName;
  final String meetingPointLocation;
  final int timeLimitCancellation;
  final int availableCapacity;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int adminId;
  final int destinationId;
  final Destination destination;
   bool favorites;

  TripSearchModel({
    required this.id,
    required this.name,
    required this.description,
    required this.tripPrice,
    required this.endDate,
    required this.capacity,
    required this.available,
    required this.startDate,
    this.guide,
    this.meetingPointName,
    required this.meetingPointLocation,
    required this.timeLimitCancellation,
    required this.availableCapacity,
    required this.createdAt,
    required this.updatedAt,
    required this.adminId,
    required this.destinationId,
    required this.destination,
    required this.favorites,
  });

  // Factory method to create a Trip from JSON
  factory TripSearchModel.fromJson(Map<String, dynamic> json) {
    return TripSearchModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      tripPrice: json['trip_price'].toDouble(),
      endDate: DateTime.parse(json['end_date']),
      capacity: json['capacity'],
      available: json['avilable']==1,
      startDate: DateTime.parse(json['start_date']),
      guide: json['guide'],
      meetingPointName: json['meeting_point_name'],
      meetingPointLocation: json['meeting_point_location'],
      timeLimitCancellation: json['TimeLimitCancellation'],
      availableCapacity: json['available_capacity'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      adminId: json['AdminId'],
      destinationId: json['DestenationId'],
      destination: Destination.fromJson(json['Destenation']),
      favorites: json['favorites'],
    );
  }

  // Method to convert a Trip instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'trip_price': tripPrice,
      'end_date': endDate.toIso8601String(),
      'capacity': capacity,
      'avilable': available,
      'start_date': startDate.toIso8601String(),
      'guide': guide,
      'meeting_point_name': meetingPointName,
      'meeting_point_location': meetingPointLocation,
      'TimeLimitCancellation': timeLimitCancellation,
      'available_capacity': availableCapacity,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'AdminId': adminId,
      'DestenationId': destinationId,
      'Destenation': destination.toJson(),
      'favorites': favorites,
    };
  } void changeFavouriteStatus(){
    favorites=!favorites;
  }

}

class Destination {
  final String name;

  Destination({
    required this.name,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}