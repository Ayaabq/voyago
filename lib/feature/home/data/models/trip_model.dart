class TripModel {
  int id;
  String name;
  String image;
  bool isFavourite;

  TripModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFavourite,
  });

  // Factory constructor to create a Destination object from JSON
  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      isFavourite: json['is_favourite'],
    );
  }


  void changeFavouriteStatus(){
    this.isFavourite=!this.isFavourite;
  }
  // Method to convert a Destination object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'is_favourite': isFavourite,
    };
  }
}
