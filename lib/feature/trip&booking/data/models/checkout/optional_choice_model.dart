class OptionalChoiceModel {
  int id;
  int child;
  int adults;
  String title;
  double adultPrice;
  double childPrice;

  OptionalChoiceModel({
    required this.id,
     this.title="",
     this.child=0,
     this.adults=0,
    this.adultPrice=0,
    this.childPrice=0,
  });

  // Factory constructor to create an instance from JSON
  factory OptionalChoiceModel.fromJson(Map<String, dynamic> json) {
    return OptionalChoiceModel(
      id: json['id'],
      child: json['child'],
      adults: json['adults'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'child': child,
      'adults': adults,
    };
  }
}
