import 'package:flutter/material.dart';
import 'package:voyago/feature/trip&booking/data/models/itinerary/event_model.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/itinerary/itinerary_item.dart';

class ItineraryList extends StatelessWidget {
  const ItineraryList({super.key, required this.events});
  final List<EventModel> events;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: events.length,
        itemBuilder: (_, index) {
          bool isFirst = (index == 0);
          bool isLast = (index == events.length - 1);
          return ItineraryItem(
            isFirst: isFirst,
            isLast: isLast,
            eventModel: events[index],
          );
        });
  }
}
