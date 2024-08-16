class EditReservation {
  int adult;
  int child;
  List<ReservedEvent> reservedEvents;
  String email;
  String phone;

  // Constructor
  EditReservation({
    required this.adult,
    required this.child,
    required this.reservedEvents,
    required this.email,
    required this.phone,
  });

  // Factory method to create an instance from a JSON object
  factory EditReservation.fromJson(Map<String, dynamic> json) {
    return EditReservation(
      adult: json['adult'],
      child: json['child'],
      reservedEvents: (json['reserved_events'] as List)
          .map((event) => ReservedEvent.fromJson(event))
          .toList(),
      email: json['email'],
      phone: json['phone'],
    );
  }

  // Method to convert an instance into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'child': child,
      'reserved_events': reservedEvents.map((event) => event.toJson()).toList(),
      'email': email,
      'phone': phone,
    };
  }
}

class ReservedEvent {
  int id;
  int adult;
  int child;

  // Constructor
  ReservedEvent({
    required this.id,
    required this.adult,
    required this.child,
  });

  // Factory method to create an instance from a JSON object
  factory ReservedEvent.fromJson(Map<String, dynamic> json) {
    return ReservedEvent(
      id: json['id'],
      adult: json['adult'],
      child: json['child'],
    );
  }

  // Method to convert an instance into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'adult': adult,
      'child': child,
    };
  }
}
