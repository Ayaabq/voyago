import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/over_view_card/higlight_text.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/over_view_card/icon_text_view.dart';

class OverViewCard extends StatelessWidget {
  const OverViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0,
          vertical: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Overview",
              style: Styles.textStyle20W700,),
              IconText(icon: Iconsax.coin,
              title: "From",
              higlightedText: "Free cancellation",),
              IconText(icon: Iconsax.clock,
              title: "3 hours",),
              IconText(icon: Iconsax.calendar_tick,
              title: "8 Oct",),
              IconText(icon: Iconsax.people,
              title: "Group Size: 20",
              higlightedText: "15 place available",),
              IconText(icon: Iconsax.map,
              title: "4 Attractions",
              isLast: true,),

            ],
          ),
        ),
      ),
    );
  }
}
