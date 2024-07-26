import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/trip&booking/data/models/itinerary/event_model.dart';

class ItineraryItem extends StatelessWidget {
 final EventModel eventModel;
  final bool isFirst;
  final bool isLast;

  const ItineraryItem({super.key,
    required this.isLast, required this.isFirst, required this.eventModel,
  });
  @override
  Widget build(BuildContext context) {
    var icon=Icons.star_outlined;
    if(isFirst) {
      icon=Icons.hourglass_top;
    }
    if(isLast) {
      icon=Icons.hourglass_bottom;
    }
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      lineXY: 0.35,
      alignment: TimelineAlign.manual,
      endChild: SizedBox(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,

            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(eventModel.title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),


                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(eventModel.description, style: const TextStyle(fontSize: 16)),
                ),

              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Row(
                  children: [
                    const Icon(Icons.sticky_note_2, size: 16),
                    const SizedBox(width: 5),

                      Text(eventModel.additionalNote, style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      startChild: Padding(
        padding: const EdgeInsets.only(right: 2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric( horizontal:10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: CustomColors.kMove[1]
              ),
                child: Text("${eventModel.duration}min",
                    style:Styles.textStyle16W700.copyWith(color: CustomColors.kMove[7]))),
          ],
        ),
      ),
      beforeLineStyle: LineStyle(color: CustomColors.kMove[2],
      ),
      afterLineStyle: LineStyle(
          color: CustomColors.kMove[2]
      ),
      indicatorStyle: IndicatorStyle(
        width:(isFirst||isLast)?30: 25,
          color: (isFirst||isLast)?CustomColors.kMove[5]:CustomColors.kMove[2],
          iconStyle:IconStyle(iconData: icon, color:(isFirst||isLast)?CustomColors.kWhite[0]: CustomColors.kMove[5] ))
    );
  }
}
