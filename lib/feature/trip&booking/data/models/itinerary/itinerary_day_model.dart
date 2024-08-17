import 'event_model.dart';

class ItineraryDay {
  final int orderOfDay;
  final int? dayId;
  final List<EventModel> events;

  ItineraryDay({
    required this.orderOfDay,
    required this.events,
    this.dayId
  });

  factory ItineraryDay.fromJson(Map<String, dynamic> json) {
    var eventList = json['events'] as List;
    List<EventModel> events = eventList.map((event) => EventModel.fromJson(event)).toList();

    return ItineraryDay(
      orderOfDay: json['order_of_day']??1,
      events: events,
      dayId: json['day_id']??5
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_of_day': orderOfDay,
      'events': events.map((event) => event.toJson()).toList(),
    };
  }
}
