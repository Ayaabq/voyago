import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';
import 'package:voyago/feature/trip&booking/data/models/checkout/optional_choice_model.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_card.dart';
import '../../../../../core/widgets/dialog/dialog_void.dart';
import '../../../../trip&booking/presentation/views/maneger/checkout_cubit/checkout_cubit.dart';
import '../../../../trip&booking/presentation/views/maneger/checkout_cubit/checkout_state.dart';
import '../../../../trip&booking/presentation/views/widgets/checkout/contact_details_section.dart';
import '../../../../trip&booking/presentation/views/widgets/checkout/optinal_choices_list.dart';
import '../../../../trip&booking/presentation/views/widgets/checkout/travler_number.dart';
import '../../../data/models/detiles_books.dart';

class EditBookBody extends StatefulWidget {
  //
  // void initState() {
  //   manager = context.read<CheckoutCubit>();
  //   super.initState();
  //
  //   // Add listeners to the controllers
  //   _emailController.addListener(_onEmailChanged);
  //   _phoneController.addListener(_onPhoneChanged);
  // }

  const EditBookBody({super.key, required this.tripData, required this.tripID});
  final int tripID;
  final TripDataDD tripData;
  @override
  State<EditBookBody> createState() => _EditBookBodyState();
}

class _EditBookBodyState extends State<EditBookBody> {
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late CheckoutCubit manager;
  late int tripID;
  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    _emailController.removeListener(_onEmailChanged);
    _phoneController.removeListener(_onPhoneChanged);

    super.dispose();
  }

  void _onEmailChanged() {
    manager.updateEmail(_emailController.text);
  }

  void _onPhoneChanged() {
    manager.updatePhoneNumber(_phoneController.text);
  }

  @override
  void initState() {
    manager = context.read<CheckoutCubit>();
    _emailController =
        TextEditingController(text: widget.tripData.details.email);
    _phoneController =
        TextEditingController(text: widget.tripData.details.phoneNumber);
    tripID = widget.tripID;
    manager.initCubit(
        widget.tripData.details.adults,
        widget.tripData.details.children,
        widget.tripData.details.email,
        widget.tripData.details.phoneNumber,
        widget.tripData.reservedEvents
            .map((e) => OptionalChoiceModel(
                id: e.eventId,
                title: e.event.title ?? "",
                adultPrice: (e.event.priceAdult ?? 0).toDouble(),
                childPrice: (e.event.priceChild ?? 0).toDouble()))
            .toList(),
    );
    // Add listeners to the controllers
    _emailController.addListener(_onEmailChanged);
    _phoneController.addListener(_onPhoneChanged);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomCard(
          content: TravelerNumber(
            //TODO غيري العدد لماكس الحجوزات
            max: 500,
          ),
          title: "Number of travelers".tr(),
        ),
        // TODO غيري الماكس لماكس الرحلة
        CustomCard(
          title: "Optional choices".tr(),
          content: OptionalChoicesList(
            id: widget.tripID,
            max: 500,
          ),
        ),
        CustomCard(
          title: "Contact details".tr(),
          content: ContactDetailsSection(
            emailController: _emailController,
            phoneController: _phoneController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ButtonAuth(
              title: "Edit",
              onTap: () async{
                final subscription = manager.stream.listen((state)async {
                  if (state is CheckoutSuccess) {
                    showSuccessDialog(context,subtitle: "Your booking has been submitted");
                    await Future.delayed(const Duration(seconds: 1));

                    GoRouter.of(context).push(AppRouter.kHomeView);

                    // dialog++;
                  } else if (state is CheckoutError) {
                    showFailureDialog(context, sutitle: state.message+ " make sure you have blance");
                    // dialog++;
                  } else if (State is CheckoutLoading) {
                    showWatingDialog(context);
                    // dialog++;
                  }
                });
                await manager.editCheckout(widget.tripData.details.id);
                await Future.delayed(const Duration(seconds: 1));

              }),
        )
      ],
    );
  }
}
