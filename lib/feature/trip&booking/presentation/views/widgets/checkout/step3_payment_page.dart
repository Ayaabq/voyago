
import 'package:flutter/material.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:voyago/core/widgets/custom_card.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/price_details_section.dart';

class Step3PaymentPage extends StatelessWidget {
  const Step3PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return   const CustomCard(
      title: "Payment Details",
      content: Column(
        children: [
          Text("Enter your password to verify the payment process.",
          style: Styles.textStyle13W400,),

          PriceDetailsSection(),
        ],
      ),
    );
  }
}

