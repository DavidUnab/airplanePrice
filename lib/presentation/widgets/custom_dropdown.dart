import 'package:airplane_price/config/constants/color_constants.dart';
import 'package:airplane_price/config/constants/style_contants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String labelText;
  final String hintText;
  final List<String> items;
  final String? selectedItem;
  final Function(String) onSelectedItem;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.labelText,
    required this.hintText,
    this.selectedItem,
    required this.onSelectedItem,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedItem;
    if (selectedValue != null) {
      isFocused = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    widget.hintText,
                    style: StyleConstants.labelTextStyle,
                  ),
                  value: selectedValue,
                  items: widget.items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: StyleConstants.labelTextStyle),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue;
                      isFocused = true;
                    });
                    if (newValue != null) {
                      widget.onSelectedItem(newValue);
                    }
                  },
                  buttonStyleData: ButtonStyleData(
                    padding: const EdgeInsets.all(8),
                    elevation: 2,
                    decoration: BoxDecoration(
                      color: ColorConstants.backgroundTextInput,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: ColorConstants.backgroundTextInput,
                        width: 1,
                      ),
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      color: ColorConstants.backgroundTextInput,
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: ColorConstants.backgroundTextInput),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 15),
            child: selectedValue != null
                ? Container(
                    decoration: BoxDecoration(
                      color: ColorConstants.backgroundTextInput,
                      border: Border.all(
                          color: ColorConstants.backgroundTextInput, width: 1),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        widget.labelText,
                        style: const TextStyle(
                          fontSize: 13,
                          color: ColorConstants.primaryText,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
        ),
      ],
    );
  }
}
