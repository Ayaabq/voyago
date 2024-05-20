import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/icons_text.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/included_card/active_included.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/included_card/inactive_included.dart';

class IncludedColumn extends StatelessWidget {
  const IncludedColumn({super.key, required this.airCondition, required this.tourGuide, required this.breakfast, required this.wifi, required this.lanch});
   final bool airCondition;
   final bool tourGuide;
   final bool breakfast;
   final bool wifi;
   final bool lanch ;
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        airCondition? const ActiveIncluded(title: "Air-Condition") : const InActiveIncluded(title: "Air-Condition"),
        Divider(),
        tourGuide? const ActiveIncluded(title: "Local tour guide") : const InActiveIncluded(title: "Local tour guide"),
        Divider(),

        breakfast? const ActiveIncluded(title: "Breakfast") : const InActiveIncluded(title: "Breakfast"),
        Divider(),

        wifi? const ActiveIncluded(title: "WiFi") : const InActiveIncluded(title: "WiFi"),
        Divider(),

        lanch? const ActiveIncluded(title: "Lunch & snacks ") : const InActiveIncluded(title: "Lunch & snacks "),


      ],
    );
  }
}
