import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';

class ItemCountWidget extends StatefulWidget {
  final String title;
  final int initialCount;
  final int? max;
  final void Function()? onAddTap;
  final void Function()? onMidTap;
  final void Function(int i)? onPressed;
  final TextStyle? textStyle;
  const ItemCountWidget({
    super.key,
    required this.title,
    this.initialCount = 0,
    this.onPressed,
    this.max, this.onAddTap, this.onMidTap, this.textStyle,
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
    if (widget.max != null && _count + 1 <= widget.max!) {
      setState(() {
        _count++;
      });
      if(widget.onAddTap!=null)widget.onAddTap!();
    }
    if(widget.onPressed!=null)widget.onPressed!(_count);
  }

  void _decrement() {
    if (_count > 0) {
      setState(() {
        _count--;
      });
      if(widget.onMidTap!=null)widget.onMidTap!();
      if(widget.onPressed!=null)widget.onPressed!(_count);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: widget.textStyle??Styles.textStyle16W400,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_circle_up_rounded,
              color: CustomColors.kHighlightMove),
          onPressed: _increment,
        ),
        Text(
          '$_count',  // Changed to reflect the internal count
          style: const TextStyle(fontSize: 18),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_circle_down_rounded,
              color: CustomColors.kHighlightMove),
          onPressed: _decrement,
        ),
      ],
    );
  }
}
