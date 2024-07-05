import 'package:flutter/material.dart';

import '../../../../../../core/utils/custom_colors.dart';

class StepIndicator extends StatelessWidget {
  final int currentPage;

  const StepIndicator({
    super.key,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStepButton(context, 0, "Step 1"),
          Icon(Icons.arrow_forward_ios, color: CustomColors.kMove[3]),
          _buildStepButton(context, 1, "Step 2"),
          Icon(Icons.arrow_forward_ios, color: CustomColors.kMove[3]),
          _buildStepButton(context, 2, "Payment"),
        ],
      ),
    );
  }

  Widget _buildStepButton(BuildContext context, int step, String title) {
    bool isSelected = step == currentPage;
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? CustomColors.kMove[3] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: CustomColors.kMove[3]),
      ),
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? CustomColors.kWhite[0] : CustomColors.kMove[3],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}