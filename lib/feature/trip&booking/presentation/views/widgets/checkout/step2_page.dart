import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:voyago/core/utils/screen_size_util.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/contact_details_section.dart';
import 'package:voyago/feature/trip&booking/presentation/views/widgets/checkout/highlights_section.dart';

import '../../../../../../core/utils/custom_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_card.dart';

class Step2Page extends StatefulWidget {
  const Step2Page({super.key});

  @override
  State<Step2Page> createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return ListView(
      children: [
        const CustomCard(
          content: HighlightsSection(),
          title: 'Activity highlights',
        ),
        CustomCard(
            title: 'contact details',
            content:ContactDetailsSection(emailController: _emailController,
                phoneController: _phoneController,)),
        CustomCard(
          content: BulletedList(
            bulletColor: CustomColors.kBlack[2],
            listItems: const [
              Text(
                "The tour operator will call the number you entered if they need to reach you ",
                style: Styles.textStyle14W400,
              ),
              Text(
                "We will use your registered email to send you trip updates and booking ticket.",
                style: Styles.textStyle14W400,
              ),
            ],
            bulletType: BulletType.conventional,
          ),
          title: 'Notes',
        ),
         SizedBox(
          height: MediaQuery.of(context).viewInsets.bottom,
        ),
      ],
    );
  }
}
