import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom(
      {super.key,
      required this.hint,
      required this.onPressedIcon,
      required this.icon});

  final String hint;
  final void Function() onPressedIcon;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: hint,
        suffixIcon: IconButton(onPressed: onPressedIcon, icon: icon),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(CustomColors.kMove[4]),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide:
            BorderSide(color: color ?? CustomColors.kGrey[0], width: 1));
  }
}
