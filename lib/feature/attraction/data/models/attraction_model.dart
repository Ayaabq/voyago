class AttractionModel {
  int id;
  String name;
  String? image;
  bool isFavourite;
  double rate;

  AttractionModel({
    required this.id,
    required this.name,
     this.image,
    required this.isFavourite,
    required this.rate
  }) ;

  // Factory constructor to create a Attraction object from JSON
  factory AttractionModel.fromJson(Map<String, dynamic> json) {
    return AttractionModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      isFavourite: json['is_favourite']??json['favorites'],
      rate: (json['rate']!=null)?double.parse(json['rate']):0.0
    );
  }


  void changeFavouriteStatus(){
    isFavourite=!isFavourite;
  }
  // Method to convert a Attraction object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'is_favourite': isFavourite,
      'rate' : rate
    };
  }
}
