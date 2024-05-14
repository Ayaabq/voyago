import 'package:flutter/material.dart';
import 'package:voyago/core/utils/styles.dart';

class SearchElevatedButton extends StatelessWidget {
  const SearchElevatedButton({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: SizedBox(
          height: 36,
          child: ElevatedButton(
              onPressed: onTap,
              child: const Row(
                children: [
                  Icon(Icons.search_outlined,
                  size: 30,),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Where to go?",
                  style: Styles.textStyle16W400,),
                ],
              )),
        ));
  }
}
