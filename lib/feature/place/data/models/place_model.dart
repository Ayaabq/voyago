class PlaceModel {
  String name;
  String location;
  double rate;
  int reviews;
  String description;
  int? tripsIncluded; // Nullable

  PlaceModel({
    required this.name,
    required this.location,
    required this.rate,
    required this.reviews,
    required this.description,
    this.tripsIncluded, // Nullable
  });

  // Factory method to create a PlaceModel from JSON
  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      name: json['name'],
      location: json['location'],
      rate: double.parse(json['rate']),
      reviews: json['reviews'],
      description: json['description'],
      tripsIncluded: json['trips_included'] != null ? json['trips_included'] as int : null,
    );
  }

  // Method to convert a PlaceModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location,
      'rate': rate,
      'reviews': reviews,
      'description': description,
      'trips_included': tripsIncluded, // Will be null if tripsIncluded is not set
    };
  }
}
