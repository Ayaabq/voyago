import 'package:flutter/material.dart';
import 'package:voyago/core/utils/custom_colors.dart';
import 'package:voyago/feature/destination/data/models/destination_model.dart';

class CustomDropdown extends StatefulWidget {
  final List<DestinationModel> items;
  final ValueChanged<String?> onChanged;
  final String hintText;
  final String? initialValue;

  CustomDropdown({
    required this.items,
    required this.onChanged,
    this.hintText = 'Select an option',
    this.initialValue,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: CustomColors.kMove[4], width: 2),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Text(
            widget.hintText,
            style: TextStyle(color: CustomColors.kMove[5]),
          ),
          icon: Icon(
            Icons.arrow_drop_down,
            color: CustomColors.kMove[4],
          ),
          isExpanded: true,
          style: TextStyle(color: Colors.black, fontSize: 16),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(15),
          items: widget.items.map(( item) {
            return DropdownMenuItem<String>(
              value: item.name,
              child: Text(item.name),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
            widget.onChanged(newValue);
          },
        ),
      ),
    );
  }
}