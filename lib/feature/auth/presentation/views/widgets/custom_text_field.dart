import 'package:flutter/material.dart';

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
        focusedBorder: buildBorder(const Color(0xff8879CF)),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide:
            BorderSide(color: color ?? const Color(0xffC4C4C4), width: 1));
  }
}
