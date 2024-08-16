import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/button_auth.dart';

import '../../../../../core/widgets/custom_card.dart';
import '../../../../trip&booking/presentation/views/maneger/checkout_cubit/checkout_cubit.dart';
import '../../../../trip&booking/presentation/views/widgets/checkout/contact_details_section.dart';
import '../../../../trip&booking/presentation/views/widgets/checkout/optinal_choices_list.dart';
import '../../../../trip&booking/presentation/views/widgets/checkout/travler_number.dart';

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
  const EditBookBody({super.key, required this.tripID});
 final int tripID;

  @override
  State<EditBookBody> createState() => _EditBookBodyState();
}

class _EditBookBodyState extends State<EditBookBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late CheckoutCubit manager;

  @override
  void dispose() {
    //   manager = context.read<CheckoutCubit>();

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


    // Add listeners to the controllers
      _emailController.addListener(_onEmailChanged);
      _phoneController.addListener(_onPhoneChanged);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  ListView(
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
          content:
          OptionalChoicesList(id: widget.tripID,  max: 500,),
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
          child: ButtonAuth(title: "Edit", onTap: (){}),
        )
      ],
    );
  }
}
