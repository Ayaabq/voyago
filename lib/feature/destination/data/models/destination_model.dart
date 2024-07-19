class DestinationModel {
  int id;
  String name;
  String? image;
  bool isFavourite;

  DestinationModel({
    required this.id,
    required this.name,
     this.image,
    required this.isFavourite,
  });

  // Factory constructor to create a Destination object from JSON
  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
      id: json['id'],
      name: json['name'],
      image: json['image']!=null ? json['image'] :null,
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
