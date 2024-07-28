import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voyago/core/utils/app_router.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/screen_size_util.dart';
import '../../../../profile/presentation/views/widgets/appbar_profile.dart';
import '../../../../trip&booking/presentation/views/widgets/checkout/price_details_section.dart';
import '../../../../trip&booking/presentation/views/widgets/over_view_card/icon_text_view.dart';

class DetilesBooksView extends StatelessWidget {
  const DetilesBooksView({super.key});

  @override
  Widget build(BuildContext context) {
  //  final String paymentState;
    return Scaffold(
        body: ListView(children: [
      Column(children: [
        const ProfileAppBar(
          titel: 'My bookings',
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          decoration: BoxDecoration(
              color: CustomColors.kWhite[4],
              borderRadius: BorderRadius.circular(32)),
          child: const Text(
            "Booking id: 32146021",
            style: Styles.textStyle16W400,
          ),
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            HomeAssets.dummyOffers, // replace with your image asset path
            height: 170,
            width: ScreenSizeUtil.dynamicWidth(.90),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Berlin: 3-Hours City Tour by Boat ",
          style: Styles.textStyle16W400,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              IconText(
                  icon: Iconsax.location,
                  title: 'Berlin, Germany',
                  iconColor: CustomColors.kMove[5]),
              IconText(
                  icon: Iconsax.calendar_tick,
                  title: "Form:" ' Wed, October 8, 2024',
                  iconColor: CustomColors.kMove[5]),
              IconText(
                  icon: Iconsax.calendar_tick,
                  title: "To:" ' Wed, October 8, 2024',
                  iconColor: CustomColors.kMove[5]),
              IconText(
                  icon: Iconsax.clock,
                  title: 'start at:',
                  iconColor: CustomColors.kMove[5]),
              IconText(
                icon: Iconsax.user,
                title: '2 Adults, 1 Child',
                iconColor: CustomColors.kMove[5],
              ),
              IconText(
                  isLast: false,
                  icon: Iconsax.location,
                  title: 'Meeting point:',
                  iconColor: CustomColors.kMove[5]),
              IconText(
                  icon: Icons.phone_outlined,
                  title: 'phone:',
                  iconColor: CustomColors.kMove[5]),
              Row(
                children: [
                  IconText(
                      isLast: false,
                      icon: Iconsax.wallet,
                      title: 'Payment status:',
                      iconColor: CustomColors.kMove[5]),
                  const SizedBox(width: 16),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        color: CustomColors.kMove[5],
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      "paymentState",
                      style: Styles.textStyle14W600
                          .copyWith(color: CustomColors.kWhite[0]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              /// TODO:  ekhty hety el trip price
              const PriceDetailsSection(tripPrice: 0,),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 75),
                      backgroundColor: CustomColors.kMove[5],
                      foregroundColor: CustomColors.kWhite[0],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Icon(Iconsax.edit),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 75),
                      backgroundColor: CustomColors.kMove[5],
                      foregroundColor: CustomColors.kWhite[0],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Icon(Iconsax.trash),
                  )
                ],
              ),
              const SizedBox(height: 10),
              ButtonAuth(
                  title: "See the full trip details",
                  onTap: () {
                    GoRouter.of(context)
                        .pushReplacement(AppRouter.kTripDetailsView);
                  }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ]),
    ]));
  }
}
