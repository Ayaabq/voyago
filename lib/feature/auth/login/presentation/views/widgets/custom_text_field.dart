import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';

class TextFieldCustom extends HookWidget {
  const TextFieldCustom({
    super.key,
    required this.hint,
    required this.onPressedIcon,
    required this.icon,
    required this.keyboardType,
    this.controller,
    this.obscureText = false,
    required this.validator,
  });

  final String hint;
  final void Function() onPressedIcon;
  final Icon icon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  // final  Function() validator;
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
        errorBorder: buildBorder(),
        focusedErrorBorder: buildBorder(const Color.fromARGB(255, 247, 158, 152)),
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



// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:regexpattern/regexpattern.dart';
// import 'package:voyago/core/utils/custom_colors.dart';
// import 'package:voyago/core/utils/styles.dart';

// class TextFieldCustom extends HookWidget {
//   const TextFieldCustom({
//     super.key,
//     required this.hint,
//     required this.onPressedIcon,
//     required this.icon,
//     required this.keyboardType,
//     this.controller,
//     this.obscureText = false,
//     required this.validator,
//   });

//   final String hint;
//   final void Function() onPressedIcon;
//   final Icon icon;
//   final TextInputType keyboardType;
//   final TextEditingController? controller;
//   final bool obscureText;
//   final String? Function(String?)? validator;

//   @override
//   Widget build(BuildContext context) {
//     final focusNode = useFocusNode();

//     return SizedBox(
//       height: 80, // اجعل الحجم أكبر لضمان الثبات
//       child: Column(
//         children: [
//           Expanded(
//             child: TextFormField(
//               autovalidateMode: AutovalidateMode.always,
//               validator: validator,
//               controller: controller,
//               keyboardType: keyboardType,
//               focusNode: focusNode,
//               decoration: InputDecoration(
//                 labelText: hint,
//                 labelStyle: const TextStyle(
//                   fontSize: 13,
//                   color: Colors.black, // الحفاظ على لون النص الثابت
//                 ),
//                 suffixIcon: AnimatedBuilder(
//                   animation: focusNode,
//                   builder: (context, _) {
//                     return IconButton(
//                       onPressed: onPressedIcon,
//                       icon: icon,
//                       color: focusNode.hasFocus
//                           ? CustomColors.kMove[4]
//                           : CustomColors.kGrey[0],
//                     );
//                   },
//                 ),
//                 enabledBorder: buildBorder(),
//                 focusedBorder: buildBorder(CustomColors.kMove[4]),
//                 errorBorder: buildBorder(Colors.red),
//                 focusedErrorBorder: buildBorder(Colors.red),
//                 errorStyle: const TextStyle(
//                   height: 0, // إخفاء رسالة الخطأ من التأثير على الحجم
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(vertical: 15.0), // padding to ensure the size remains constant
//               ),
//               obscureText: obscureText,
//             ),
//           ),
//           if (validator != null)
//             Padding(
//               padding: const EdgeInsets.only(left: 16.0),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   validator!(controller?.text) ?? '',
//                   style: const TextStyle(color: Colors.red, fontSize: 12),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   OutlineInputBorder buildBorder([Color? color]) {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(14),
//       borderSide: BorderSide(color: color ?? CustomColors.kGrey[0], width: 1),
//     );
//   }
// }
