class BooksModel {
  final List<TripData> data;

  BooksModel({required this.data});

  factory BooksModel.fromJson(Map<String, dynamic> json) {
    return BooksModel(
      data: List<TripData>.from(json['data'].map((item) => TripData.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((trip) => trip.toJson()).toList(),
    };
  }
}

class TripData {
  final int id;
  final int adult;
  final int child;
  final int tripId;
  final Trip trip;

  TripData({
    required this.id,
    required this.adult,
    required this.child,
    required this.tripId,
    required this.trip,
  });

  factory TripData.fromJson(Map<String, dynamic> json) {
    return TripData(
      id: json['id'],
      adult: json['adult'],
      child: json['child'],
      tripId: json['TripId'],
      trip: Trip.fromJson(json['Trip']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'adult': adult,
      'child': child,
      'TripId': tripId,
      'Trip': trip.toJson(),
    };
  }
}

class Trip {
  final String name;
  final String startDate;
  final Destenation destenation;

  Trip({
    required this.name,
    required this.startDate,
    required this.destenation,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      name: json['name'],
      startDate: json['start_date'],
      destenation: Destenation.fromJson(json['Destenation']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'start_date': startDate,
      'Destenation': destenation.toJson(),
    };
  }
}

class Destenation {
  final String name;

  Destenation({required this.name});

  factory Destenation.fromJson(Map<String, dynamic> json) {
    return Destenation(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
