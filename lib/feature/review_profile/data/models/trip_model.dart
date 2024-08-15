class TripModelRev {
  final int id;
  final String comment;
  final int rate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int userId;

  TripModelRev({
    required this.id,
    required this.comment,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  factory TripModelRev.fromJson(Map<String, dynamic> json) {
    return TripModelRev(
      id: json['id'],
      comment: json['comment'],
      rate: json['rate'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      userId: json['UserId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'comment': comment,
      'rate': rate,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'UserId': userId,
    };
  }
}
