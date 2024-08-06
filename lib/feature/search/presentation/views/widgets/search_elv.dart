import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/core/utils/styles.dart';
import 'package:iconsax/iconsax.dart';

class SearchElevated extends StatelessWidget {
  const SearchElevated({
    super.key,
    required this.onTap, required this.fillColor, required this.searchController,
  });
  final void Function() onTap;
  final Color fillColor;
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      height: 38,

      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Damascus',
          hintStyle: const TextStyle(color: Colors.black54),
          prefixIcon: Icon(Iconsax.search_normal, color: CustomColors.kMove[4]),
          suffixIcon: IconButton(
            icon: Icon(Icons.close, color: CustomColors.kMove[4]),
            onPressed: () {
              //    _searchController.clear();
            },
          ),
          fillColor: fillColor,
          filled: true,
          contentPadding: const EdgeInsets.all(0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: fillColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:  BorderSide(color: fillColor),
          ),
        ),
      ),

// Row(
//             children: [
//               const Icon(
//                 Iconsax.search_normal,
//                 size: 24,
//               ),
//               const SizedBox(
//                 width: 5,
//               ),
//               // const Text(
//               //   "Where to go?",
//               //   style: Styles.textStyle16W400,
//               // ),
//               const Spacer(),
//               Icon(
//                 Icons.close,
//                 color: CustomColors.kMove[4],
//               )
//             ],
//           )),
    ));
  }
}
