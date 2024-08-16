class TripDetails {
  final String tripName;
  final String destination;
  final String meetingPoint;
  final int adults;
  final int children;
  final String phoneNumber;
  final int tripPrice;
  final int totalPrice;

  TripDetails({
    required this.tripName,
    required this.destination,
    required this.meetingPoint,
    required this.adults,
    required this.children,
    required this.phoneNumber,
    required this.tripPrice,
    required this.totalPrice,
  });

  factory TripDetails.fromJson(Map<String, dynamic> json) {
    return TripDetails(
      tripName: json['trip_name'],
      destination: json['destination'],
      meetingPoint: json['meeting_point'],
      adults: json['adults'],
      children: json['children'],
      phoneNumber: json['phone_number'],
      tripPrice: json['trip_price'],
      totalPrice: json['total_price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trip_name': tripName,
      'destination': destination,
      'meeting_point': meetingPoint,
      'adults': adults,
      'children': children,
      'phone_number': phoneNumber,
      'trip_price': tripPrice,
      'total_price': totalPrice,
    };
  }
}

class ReservedEvent {
  final int? adult;
  final int child;
  final int eventId;

  ReservedEvent({
    this.adult,
    required this.child,
    required this.eventId,
  });

  factory ReservedEvent.fromJson(Map<String, dynamic> json) {
    return ReservedEvent(
      adult: json['adult'],
      child: json['child'],
      eventId: json['EventId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'child': child,
      'EventId': eventId,
    };
  }
}

class Event {
  final int id;
  final int? priceAdult;
  final int? priceChild;

  Event({
    required this.id,
    this.priceAdult,
    this.priceChild,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      priceAdult: json['price_adult'],
      priceChild: json['price_child'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price_adult': priceAdult,
      'price_child': priceChild,
    };
  }
}
/////
class TripData {
  final TripDetails details;
  final List<ReservedEvent> reservedEvents;
  final List<Event> events;
  final String dateToDisableEditAndCancellation;

  TripData({
    required this.details,
    required this.reservedEvents,
    required this.events,
    required this.dateToDisableEditAndCancellation,
  });

  factory TripData.fromJson(Map<String, dynamic> json) {
    return TripData(
      details: TripDetails.fromJson(json['details']),
      reservedEvents: (json['reserved_events'] as List)
          .map((e) => ReservedEvent.fromJson(e))
          .toList(),
      events: (json['events'] as List)
          .map((e) => Event.fromJson(e))
          .toList(),
      dateToDisableEditAndCancellation:
          json['date_to_disable_edit_and_cancellation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'details': details.toJson(),
      'reserved_events': reservedEvents.map((e) => e.toJson()).toList(),
      'events': events.map((e) => e.toJson()).toList(),
      'date_to_disable_edit_and_cancellation': dateToDisableEditAndCancellation,
    };
  }
}
