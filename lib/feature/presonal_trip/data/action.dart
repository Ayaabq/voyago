class Activity {
  String action;
  String title;
  int duration;
  int personalDayId;

  Activity({
    required this.action,
    required this.title,
    required this.duration,
    required this.personalDayId,
  });

  // Factory method to create an Activity instance from JSON
  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      action: json['action'],
      title: json['title'],
      duration: json['duration'],
      personalDayId: json['PersonalDayId'],
    );
  }

  // Method to convert an Activity instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'action': action,
      'title': title,
      'duration': duration,
      'PersonalDayId': personalDayId,
    };
  }
}
