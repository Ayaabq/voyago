import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_card.dart';

class MeetingPointCard extends StatelessWidget {
  const MeetingPointCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCard(
      title: "Meeting Point",
      content: Text(
        "Meet at the “Stern und Kreisschiffahrt” ticket pavilion in "
        "the Nikolaiviertel. On the opposite bank of the river "
        "to the Humboldt Forum.",
        style: Styles.textStyle14W400,
      ),
    );
  }
}
