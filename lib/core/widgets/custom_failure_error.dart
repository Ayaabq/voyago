import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';

import '../utils/styles.dart';

class CustomFailureError extends StatelessWidget {

  const CustomFailureError(
    { super.key, required this.errMessage });
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Text(errMessage,
    style: Styles.textStyle18W400.copyWith(
      color:CustomColors.errorColor
    ));
  }
}