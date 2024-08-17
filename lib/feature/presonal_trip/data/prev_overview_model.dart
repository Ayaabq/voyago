import 'package:intl/intl.dart';

class PrevOverview {
  final int id;
  final String name;
  final DateTime startDate;
  final String notes;
  final int duration;

  PrevOverview({
    required this.id,
    required this.name,
    required this.startDate,
    required this.notes,
    required this.duration,
  });

  factory PrevOverview.fromJson(Map<String, dynamic> json) {
    return PrevOverview(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      startDate: json['start_date'] != null
          ? DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(json['start_date'])
          : DateTime.now(),
      notes: json['notes'] ?? '',
      duration: json['duration'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'start_date': startDate.toIso8601String(),
      'notes': notes,
      'duration': duration,
    };
  }
}
