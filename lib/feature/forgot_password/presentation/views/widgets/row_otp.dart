import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voyago/core/utils/custom_colors.dart';

class Otp extends StatelessWidget {
  const Otp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(CustomColors.kMove[4]),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: Theme.of(context).textTheme.headlineSmall,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: color ?? CustomColors.kGrey[0], width: 1));
}
