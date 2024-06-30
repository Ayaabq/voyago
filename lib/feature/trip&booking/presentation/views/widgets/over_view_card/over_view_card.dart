import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/over_view_card/higlight_text.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/over_view_card/icon_text_view.dart';

class OverViewCard extends StatelessWidget {
  const OverViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  const CustomCard(title: "Overview", content:
   Column(
     children:[IconText(icon: Iconsax.coin,
      price: 80,
      title: "From ",
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
        isLast: true,),])
    );
  }
}
