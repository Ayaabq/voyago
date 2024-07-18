class TripInfo1Model{
  TripInfo1Model({required this.name, required this.location, required this.rate, required this.reviews, required this.price});


  final String name;
  final String location;
  final double rate;
  final int reviews;
  final num price;

  factory TripInfo1Model.fromJson(Map<String, dynamic> json){
    return TripInfo1Model(
        name: json["name"],
        location: json["location"],
        rate: double.parse(json["rate"]),
        reviews: json["reviews"],
        price: json["price"]);
  }
}