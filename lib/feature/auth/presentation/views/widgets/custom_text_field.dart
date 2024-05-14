// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:voyago/core/utils/custom_colors.dart';

// class TextFieldCustom extends HookWidget {
//   const TextFieldCustom(
//       {super.key,
//       required this.hint,
//       required this.onPressedIcon,
//       required this.icon});

//   final String hint;
//   final void Function() onPressedIcon;
//   final Icon icon;
//   @override
//   Widget build(BuildContext context) {
//     final focusNode = useFocusNode();
//     return TextFormField(
//       focusNode: focusNode,
//       decoration: InputDecoration(
//         labelText: hint,
//      //   hintText: hint,
//         labelStyle: const TextStyle(
//           fontSize: 12,
//         ),
//         suffixIcon: IconButton(
//             onPressed: onPressedIcon,
//             icon: icon,
//             color: focusNode.hasFocus
//                 ? CustomColors.kMove[4]
//                 : CustomColors.kGrey[0]),
//         enabledBorder: buildBorder(),
//         focusedBorder: buildBorder(CustomColors.kMove[4]),
//       ),
//     );
//   }

//   OutlineInputBorder buildBorder([color]) {
//     return OutlineInputBorder(
//         borderRadius: BorderRadius.circular(14),
//         borderSide:
//             BorderSide(color: color ?? CustomColors.kGrey[0], width: 1));
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:voyago/core/utils/custom_colors.dart';

// class TextFieldCustom extends StatefulWidget {
//   const TextFieldCustom(
//       {super.key,
//       required this.hint,
//       required this.onPressedIcon,
//       required this.icon});

//   final String hint;
//   final void Function() onPressedIcon;
//   final Icon icon;

//   @override
//   _TextFieldCustomState createState() => _TextFieldCustomState();
// }

// class _TextFieldCustomState extends State<TextFieldCustom> {
//   final FocusNode _focusNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(_onFocusChange);
//   }

//   @override
//   void dispose() {
//     _focusNode.removeListener(_onFocusChange);
//     _focusNode.dispose();
//     super.dispose();
//   }

//   void _onFocusChange() {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       focusNode: _focusNode,
//       decoration: InputDecoration(
//         labelText: widget.hint,
//         labelStyle: const TextStyle(
//           fontSize: 12,
//         ),
//         suffixIcon: IconButton(
//           onPressed: widget.onPressedIcon,
//           icon: widget.icon,
//           color: _focusNode.hasFocus
//               ? CustomColors.kMove[4]
//               : CustomColors.kGrey[0],
//         ),
//         enabledBorder: buildBorder(),
//         focusedBorder: buildBorder(CustomColors.kMove[4]),
//       ),
//     );
//   }

//   OutlineInputBorder buildBorder([color]) {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(14),
//       borderSide: BorderSide(color: color ?? CustomColors.kGrey[0], width: 1),
//     );
//   }
// }
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

    return SizedBox(
      height: 50,
      child: TextFormField(
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
