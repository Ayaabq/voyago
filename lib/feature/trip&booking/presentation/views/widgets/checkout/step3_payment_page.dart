
import 'package:flutter/material.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/utils/validator_manager.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/auth/login/presentation/views/widgets/custom_text_field.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/price_details_section.dart';

class Step3PaymentPage extends StatelessWidget {
  const Step3PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return    CustomCard(
      title: "Payment Details",
      content: Expanded(
        child: ListView(
          children: [
            const Text("Enter your password to verify the payment process.",
            style: Styles.textStyle13W400,),
            const SizedBox(height: 20,),
            TextFieldCustom(hint: "Password",
                onPressedIcon: (){},
                icon: const Icon(Icons.remove_red_eye), keyboardType: TextInputType.visiblePassword,
                validator: (v)=>ValidatorManager().validatePassword(v)),
        
        
            const SizedBox(height: 20,),
            const PriceDetailsSection(),
          ],
        ),
      ),
    );
  }
}

