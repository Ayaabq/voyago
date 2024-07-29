import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/helper/date_time_helper.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_info_2_model.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/over_view_card/icon_text_view.dart';

class OverViewCard extends StatelessWidget {
  const OverViewCard({super.key, required this.tripInfo2Model});
  final TripInfo2Model tripInfo2Model;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
        title: "Overview".tr(),
        content: Column(children: [
          // IconText(
          //   icon: Iconsax.coin,
          //   price: price,
          //   title: "From ",
          // ),
          IconText(
            icon: Iconsax.clock,
            title: "${tripInfo2Model.duration} ${"hours".tr()}",
          ),
          IconText(
            icon: Iconsax.calendar_tick,
            title: DateTimeHelper.formatDateDMMM(tripInfo2Model.startDate),
            higlightedText: "Free cancellation".tr(),

          ),
          IconText(
            icon: Iconsax.people,
            title: "${"Group Size:".tr()} ${tripInfo2Model.capacity}",
            higlightedText: "${tripInfo2Model.available} ${"place available".tr()}",
          ),
          IconText(
            icon: Iconsax.map,
            title: "${tripInfo2Model.attractions} ${"Attractions".tr()}",
            isLast: true,
          ),
        ],),);
  }
}
