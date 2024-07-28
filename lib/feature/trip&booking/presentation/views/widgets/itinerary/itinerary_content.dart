import 'package:flutter/material.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/itinerary/itinerary_list.dart';

import '../../../../../../core/utils/custom_colors.dart';
import '../../../../data/models/itinerary/itinerary_day_model.dart';

class ItineraryContent extends StatefulWidget {
  const ItineraryContent({super.key, required this.itineraryDays});
  final List<ItineraryDay> itineraryDays;
  @override
  _ItineraryContentState createState() => _ItineraryContentState();
}

class _ItineraryContentState extends State<ItineraryContent> {
  late String selectedDay ;
  late List<String> days ;
  int selectedIndex=0;
  @override
  void initState() {
    days=widget.itineraryDays.map((iD)=>'Day ${iD.orderOfDay}').toList();
    selectedDay=days[0];

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              borderRadius: BorderRadius.circular(20),
              decoration: InputDecoration(
                filled: true,
                fillColor: CustomColors.kMove[3],
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),

              icon: const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.white),
              ),
              iconEnabledColor: CustomColors.kWhite[0],
              dropdownColor: CustomColors.kMove[3],
              isExpanded: true,
              value: selectedDay,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDay = newValue!;
                  for(int i=0; i<days.length ;i++){
                    if(selectedDay==days[i]) selectedIndex=i;
                  }

                });
              },
              items: days.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(color: Colors.white)),
                );
              }).toList(),
            ),
             ItineraryList(
              events: widget.itineraryDays[selectedIndex].events,
            ),
          ],
        ),
      )
    ;
  }
}
