import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/utils/custom_colors.dart';

class TextFieldProfile extends HookWidget {
  const TextFieldProfile({
    super.key,
    required this.hint,
  //  required this.onPressedIcon,
  //  required this.icon,
    required this.keyboardType,
    this.controller,
    this.obscureText = false,
     this.validator,
  });

  final String hint;
  //final void Function() onPressedIcon;
 // final Icon icon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool obscureText;

  final String? Function(dynamic)? validator;
  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();

    return TextFormField(
      //auto
      autovalidateMode: AutovalidateMode.onUserInteraction,
      //   : AutovalidateMode.disabled,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      focusNode: focusNode,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        hintText: hint,
        //   labelText: hint,
        hintStyle: const TextStyle(
          fontSize: 13,
        ),
        // suffixIcon: AnimatedBuilder(
        //   animation: focusNode,
        //   builder: (context, _) {
        //     return IconButton(
        //       onPressed: onPressedIcon,
        //       icon: icon,
        //       color: focusNode.hasFocus
        //           ? CustomColors.kMove[4]
        //           : CustomColors.kGrey[0],
        //     );
        //   },
        // ),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(CustomColors.kMove[4]),
        errorBorder: buildBorder(),
        focusedErrorBorder:
            buildBorder(const Color.fromARGB(255, 247, 158, 152)),
      ),
      obscureText: obscureText,
    );
  }

  OutlineInputBorder buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: color ?? CustomColors.kGrey[0], width: 1),
    );
  }
}
