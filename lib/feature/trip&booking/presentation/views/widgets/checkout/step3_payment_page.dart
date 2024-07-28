import 'package:flutter/material.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/utils/validator_manager.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/custom_text_field.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/price_details_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/feature/trip&booking/presentation/views/maneger/checkout_cubit/checkout_cubit.dart';

class Step3PaymentPage extends StatefulWidget {
  const Step3PaymentPage({super.key, required this.tripPrice});
  final double tripPrice;

  @override
  State<Step3PaymentPage> createState() => _Step3PaymentPageState();
}

class _Step3PaymentPageState extends State<Step3PaymentPage> {
  final TextEditingController _passwordController = TextEditingController();
  late CheckoutCubit manager;

  @override
  void initState() {
    manager = context.read<CheckoutCubit>();
    super.initState();

    // Add listener to the password controller
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    // Remove listener and dispose controller
    _passwordController.removeListener(_onPasswordChanged);
    _passwordController.dispose();
    super.dispose();
  }

  void _onPasswordChanged() {
    manager.updatePassword(_passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: "Payment Details",
      content: Expanded(
        child: ListView(
          children: [
            const Text(
              "Enter your password to verify the payment process.",
              style: Styles.textStyle13W400,
            ),
            const SizedBox(height: 20),
            TextFieldCustom(
              controller: _passwordController,
              hint: "Password",
              onPressedIcon: () {},
              icon: const Icon(Icons.remove_red_eye),
              keyboardType: TextInputType.visiblePassword,
              validator: (v) => ValidatorManager().validatePassword(v),
            ),
            const SizedBox(height: 20),
            PriceDetailsSection(tripPrice: widget.tripPrice),
          ],
        ),
      ),
    );
  }
}
