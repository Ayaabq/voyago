import 'package:flutter/material.dart';
import 'package:voyago/feature/trip&booking/data/models/itinerary/event_model.dart';

import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';
import 'count_widget.dart';

class OptionalChoiceItem extends StatefulWidget {
  const OptionalChoiceItem({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  State<OptionalChoiceItem> createState() => _OptionalChoiceItemState();
}

class _OptionalChoiceItemState extends State<OptionalChoiceItem> {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(height: 8.0),
        const Text(
          'Here you can choose optional events from the itinerary',
          style: Styles.textStyle13W400,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              widget.eventModel.title,
              style: Styles.textStyle18W400,
            ),
            IconButton(
              icon: Icon(
                _isExpanded ? Icons.remove_circle_outline : Icons.add_circle_outline,
                color: !_isExpanded?CustomColors.kGrey[1]: CustomColors.kHighlightMove,
              ),
              onPressed: _toggleExpansion,
            ),
          ],
        ),
        if (_isExpanded)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Child Price: ${widget.eventModel.priceChild??0} \$",
                style: Styles.textStyle18W400,
              ),

              Text(
                "Adult Price: ${widget.eventModel.priceAdult??0} \$",
                style: Styles.textStyle18W400,
              ),
            ],
          ),
        if (_isExpanded)
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                child: ItemCountWidget(
                  title: 'Child:',
                  initialCount: 1,
                  onPressed: (j){},
                ),
              ),
              const SizedBox(width: 40,),
              Expanded(
                child: ItemCountWidget(
                  title: 'Adults:',
                  initialCount: 2,
                  onPressed: (j){},

                ),
              ),
            ],
          ),

      ],
    );
  }
}
