import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:voyago/core/utils/custom_colors.dart';

class TextFieldCustom extends HookWidget {
  const TextFieldCustom({
    super.key,
    required this.hint,
    required this.onPressedIcon,
    required this.icon,
    required this.keyboardType,
    this.controller,
    this.obscureText = false,
    // required this.validator,
  });

  final String hint;
  final void Function() onPressedIcon;
  final Icon icon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  // final String Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();

    return SizedBox(
      height: 50,
      child: TextFormField(
//auto
        autovalidateMode: AutovalidateMode.always,
        //   : AutovalidateMode.disabled,
        //    validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        focusNode: focusNode,
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: const TextStyle(
            fontSize: 13,
          ),
          suffixIcon: AnimatedBuilder(
            animation: focusNode,
            builder: (context, _) {
              return IconButton(
                onPressed: onPressedIcon,
                icon: icon,
                color: focusNode.hasFocus
                    ? CustomColors.kMove[4]
                    : CustomColors.kGrey[0],
              );
            },
          ),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(CustomColors.kMove[4]),
        ),
        obscureText: obscureText,
      ),
    );
  }

  OutlineInputBorder buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: color ?? CustomColors.kGrey[0], width: 1),
    );
  }
}
