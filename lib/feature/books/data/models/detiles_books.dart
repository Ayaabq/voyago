class TripDetails {
  final String tripName;
  final String destination;
  final String meetingPoint;
  final DateTime from;
  final DateTime to;
  final int adults;
  final int children;
  final String phoneNumber;
  final String email;
  final int tripPrice;
  final int totalPrice;
  final int id;

  TripDetails( {
    required this.tripName,
    required this.destination,
    required this.meetingPoint,
    required this.from,
    required this.to,
    required this.adults,
    required this.children,
    required this.phoneNumber,
    required this.email,
    required this.tripPrice,
    required this.totalPrice,
    required this.id
  });

  factory TripDetails.fromJson(Map<String, dynamic> json) {
    return TripDetails(
      tripName: json['trip_name'] ?? '',
      destination: json['destination'] ?? '',
      meetingPoint: json['meeting_point'] ?? '',
      from: DateTime.tryParse(json['from'] ?? '') ?? DateTime.now(),
      to: DateTime.tryParse(json['to'] ?? '') ?? DateTime.now(),
      adults: json['adults'] ?? 0,
      children: json['children'] ?? 0,
      phoneNumber: json['phone_number'] ?? '',
      email: json['email'] ?? '',
      tripPrice: json['trip_price'] ?? 0,
      totalPrice: json['total_price'] ?? 0,
      id:json['reservation_id']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trip_name': tripName,
      'destination': destination,
      'meeting_point': meetingPoint,
      'from': from.toIso8601String(),
      'to': to.toIso8601String(),
      'adults': adults,
      'children': children,
      'phone_number': phoneNumber,
      'email': email,
      'trip_price': tripPrice,
      'total_price': totalPrice,
    };
  }
}

class EventDetails {
  final String? title;
  final int? priceAdult;
  final int? priceChild;

  EventDetails({
    this.title,
    this.priceAdult,
    this.priceChild,
  });

  factory EventDetails.fromJson(Map<String, dynamic> json) {
    return EventDetails(
      title: json['title'] ?? 'Unknown Event',
      priceAdult: json['price_adult'],
      priceChild: json['price_child'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price_adult': priceAdult,
      'price_child': priceChild,
    };
  }
}

class ReservedEvent {
  final int? adult;
  final int child;
  final int eventId;
  final EventDetails event;

  ReservedEvent({
    this.adult,
    required this.child,
    required this.eventId,
    required this.event,
  });

  factory ReservedEvent.fromJson(Map<String, dynamic> json) {
    return ReservedEvent(
      adult: json['adult'],
      child: json['child'] ?? 0,
      eventId: json['EventId'] ?? 0,
      event: EventDetails.fromJson(json['Event'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'child': child,
      'EventId': eventId,
      'Event': event.toJson(),
    };
  }
}

class TripDataDD {
  final TripDetails details;
  final List<ReservedEvent> reservedEvents;
  final String dateToDisableEditAndCancellation;

  TripDataDD({
    required this.details,
    required this.reservedEvents,
    required this.dateToDisableEditAndCancellation,
  });

  factory TripDataDD.fromJson(Map<String, dynamic> json) {
    return TripDataDD(
      details: TripDetails.fromJson(json['details'] ?? {}),
      reservedEvents: (json['reserved_events'] as List? ?? [])
          .map((e) => ReservedEvent.fromJson(e))
          .toList(),
      dateToDisableEditAndCancellation:
          json['date_to_disable_edit_and_cancellation'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'details': details.toJson(),
      'reserved_events': reservedEvents.map((e) => e.toJson()).toList(),
      'date_to_disable_edit_and_cancellation': dateToDisableEditAndCancellation,
    };
  }
}
