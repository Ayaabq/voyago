import 'package:bulleted_list/bulleted_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_info_2_model.dart';
import 'package:voyago/feature/trip&booking/data/models/trip_model.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/checkout_cubit/checkout_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/trip_info_2_cubit/trip_info_2_cubit.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/contact_details_section.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/highlights_section.dart';

import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_card.dart';

class Step2Page extends StatefulWidget {
  const Step2Page({super.key, required this.trip, required this.name, required this.tripModel});
  final TripInfo2Model trip;
  final TripModel tripModel;
  final String name;
  @override
  State<Step2Page> createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late CheckoutCubit manager;

  @override
  void initState() {
    manager = context.read<CheckoutCubit>();
    super.initState();

    // Add listeners to the controllers
    _emailController.addListener(_onEmailChanged);
    _phoneController.addListener(_onPhoneChanged);
  }

  @override
  void dispose() {
    // Remove listeners and dispose controllers
    _emailController.removeListener(_onEmailChanged);
    _phoneController.removeListener(_onPhoneChanged);
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    manager.updateEmail(_emailController.text);
  }

  void _onPhoneChanged() {
    manager.updatePhoneNumber(_phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return ListView(
      children: [
        CustomCard(
          content: HighlightsSection(
            tripModel: widget.tripModel,
            name: widget.name,
            trip: widget.trip,
            child: manager.child ?? 0,
            adults: manager.adults!,
          ),
          title: "Activity highlights".tr(),
        ),
        CustomCard(
          title: "Contact details".tr(),
          content: ContactDetailsSection(
            emailController: _emailController,
            phoneController: _phoneController,
          ),
        ),
        CustomCard(
          content: BulletedList(
            bulletColor: CustomColors.kBlack[2],
            listItems:  [
              Text(
                "The tour operator will call the number you entered if they need to reach you ".tr(),
                style: Styles.textStyle14W400,
              ),
              Text(
                "We will use your registered email to send you trip updates and booking ticket.".tr(),
                style: Styles.textStyle14W400,
              ),
            ],
            bulletType: BulletType.conventional,
          ),
          title: "Notes".tr(),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
