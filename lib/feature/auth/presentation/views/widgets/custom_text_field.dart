import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:voyago/core/utils/custom_colors.dart';

class TextFieldCustom extends HookWidget {
  const TextFieldCustom(
      {super.key,
      required this.hint,
      required this.onPressedIcon,
      required this.icon});

  final String hint;
  final void Function() onPressedIcon;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    return TextFormField(
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: hint,
     //   hintText: hint,
        labelStyle: const TextStyle(
          fontSize: 12,
        ),
        suffixIcon: IconButton(
            onPressed: onPressedIcon,
            icon: icon,
            color: focusNode.hasFocus
                ? CustomColors.kMove[4]
                : CustomColors.kGrey[0]),
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
