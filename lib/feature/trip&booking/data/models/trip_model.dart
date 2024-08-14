class TripModel {
  int id;
  String name;
  String? image;
  bool isFavourite;
  num duration;
  String destination;
  num price;
  double rate;

  TripModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFavourite,
    required this.rate,
    required this.price,
    required this.destination,
    required this.duration
  }) ;


  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'],
      name: json['name'],
      image: json['image'] as String?,
      isFavourite: json['is_favourite'],
      rate: double.parse(json['rate'],) ,
      price: json['price'],
      destination: json['destenation'],
      duration: json['duration'],
    );
  }


  void changeFavouriteStatus(){
    isFavourite=!isFavourite;
  }
  // Method to convert a Destination object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'is_favourite': isFavourite,
      "duration": duration,
      "destenation": destination,
      "price": price,
      "rate": rate,
    };
  }
}
