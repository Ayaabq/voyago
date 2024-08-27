class PrevTrip {
  String name;
  int duration;
  int destinationId;
  DateTime startDate;
  Destination destination;
  int id;

  PrevTrip({
    required this.name,
    required this.duration,
    required this.destinationId,
    required this.startDate,
    required this.destination,
    required this.id
  });

  // Factory constructor to create a PersonalTrip object from JSON
  factory PrevTrip.fromJson(Map<String, dynamic> json) {
    return PrevTrip(
      name: json['name'],
      duration: json['duration'],
      destinationId: json['DestenationId'],
      startDate: DateTime.parse(json['start_date']),
      destination: Destination.fromJson(json['Destenation']),
      id: json["id"]
    );
  }

  // Method to convert a PersonalTrip object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'duration': duration,
      'DestenationId': destinationId,
      'start_date': startDate.toIso8601String(),
      'Destenation': destination.toJson(),
    };
  }
}

class Destination {
  String name;

  Destination({
    required this.name,
  });

  // Factory constructor to create a Destination object from JSON
  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      name: json['name'],
    );
  }

  // Method to convert a Destination object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
