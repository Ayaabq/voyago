import 'package:flutter/material.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/optional_choices.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/rules_section.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/travler_number.dart';

import '../../../../../../core/widgets/custom_card.dart';

class Step1Page extends StatefulWidget {
  const Step1Page({super.key});

  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {


  @override
  Widget build(BuildContext context) {
    return   ListView(
      children: const [
       CustomCard(
          content: TravelerNumber(),
          title: 'Number of travelers',
        ),
        CustomCard(
            title: 'Optional choices',
            content: OptionalChoices()),
        CustomCard(content: RulesSection()),
        SizedBox(height: 70,)
      ],
    );
  }
}
