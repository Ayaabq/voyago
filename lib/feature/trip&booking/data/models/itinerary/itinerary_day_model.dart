import 'event_model.dart';

class ItineraryDay {
  final int orderOfDay;
  final List<EventModel> events;

  ItineraryDay({
    required this.orderOfDay,
    required this.events,
  });

  factory ItineraryDay.fromJson(Map<String, dynamic> json) {
    var eventList = json['events'] as List;
    List<EventModel> events = eventList.map((event) => EventModel.fromJson(event)).toList();

    return ItineraryDay(
      orderOfDay: json['order_of_day'],
      events: events,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_of_day': orderOfDay,
      'events': events.map((event) => event.toJson()).toList(),
    };
  }
}
