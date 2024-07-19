class Feature {
  final String type;
  final String name;

  Feature({
    required this.type,
    required this.name,
  });

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      type: json['type'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'name': name,
    };
  }
}
