import 'package:flutter/material.dart';

import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';
import 'count_widget.dart';

class OptionalChoices extends StatefulWidget {
  const OptionalChoices({super.key});

  @override
  State<OptionalChoices> createState() => _OptionalChoicesState();
}

class _OptionalChoicesState extends State<OptionalChoices> {
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
            const Text(
              'Schmitt restaurant',
              style: TextStyle(fontSize: 18),
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                child: ItemCountWidget(
                  title: 'Child:',
                  initialCount: 1,
                ),
              ),
              SizedBox(width: 40,),
              Expanded(
                child: ItemCountWidget(
                  title: 'Adults:',
                  initialCount: 2,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
