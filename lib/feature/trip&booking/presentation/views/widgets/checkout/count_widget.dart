import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';

import '../../../../../../core/utils/styles.dart';

class ItemCountWidget extends StatefulWidget {
  final String title;
  final int initialCount;

  const ItemCountWidget({
    super.key,
    required this.title,
    this.initialCount = 0,
  });

  @override
  _ItemCountWidgetState createState() => _ItemCountWidgetState();
}

class _ItemCountWidgetState extends State<ItemCountWidget> {
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = widget.initialCount;
  }

  void _increment() {
    setState(() {
      if (_count < 15) _count++;
    });
  }

  void _decrement() {
    setState(() {
      if (_count > 0) _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: Styles.textStyle16W400,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_circle_up_rounded,
              color: CustomColors.kHighlightMove),
          onPressed: _decrement,
        ),
        Text(
          '$_count',
          style: const TextStyle(fontSize: 18),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_circle_down_rounded,
              color: CustomColors.kHighlightMove),
          onPressed: _increment,
        ),
      ],
    );
  }
}
