import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.label, required this.onPressed});
  final void Function() onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(

      style: ElevatedButton.styleFrom(
        
        backgroundColor: CustomColors.kMove[3],
        minimumSize:  Size(double.infinity, 38)
      ),
        onPressed: (){},
        child: Text(label,
        style: Styles.textStyle14W600.copyWith(color: Colors.white),) );

  }
}
