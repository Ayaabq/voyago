class OptionalChoiceModel {
  int id;
  int child;
  int adults;

  OptionalChoiceModel({
    required this.id,
    required this.child,
    required this.adults,
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
