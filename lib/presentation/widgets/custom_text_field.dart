import 'package:airplane_price/config/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? helperText;
  final TextInputType keyboardType;
  final int? minValue;
  final int? maxValue;
  final RegExp? regExp;
  final ValueChanged<bool> onError;
  final ValueChanged<String> onChanged;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.helperText,
    this.keyboardType = TextInputType.text,
    this.minValue,
    this.maxValue,
    this.regExp,
    required this.onError,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorText;
  RegExp defaultRegExp = RegExp(r'[0-9]');

  @override
  void initState() {
    super.initState();
  }

  void _validateInput(String value2) {
    String controller = value2;
    final int? value = int.tryParse(controller);

    if (widget.regExp != null) {
      if (controller.isEmpty) {
        setState(() {
          errorText = 'Valor no válido';
        });
        widget.onError(true);
      } else {
        setState(() {
          errorText = null;
        });
        widget.onError(false);
      }
    } else {
      if (value == null) {
        setState(() {
          errorText = 'Valor no válido';
        });
        widget.onError(true);
      } else if (widget.minValue != null && value < widget.minValue! ||
          widget.maxValue != null && value > widget.maxValue!) {
        setState(() {
          errorText =
          'Valor fuera de rango (${widget.minValue}-${widget.maxValue})';
        });
        widget.onError(true);
      } else {
        setState(() {
          errorText = null;
        });
        widget.onError(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      inputFormatters: _getFormatter(),
      cursorWidth: 2.0,
      cursorColor: ColorConstants.primaryText,
      keyboardType: widget.keyboardType,
      style: const TextStyle(color: ColorConstants.primaryText),
      onChanged: (value) {
        _validateInput(value);
        print('OnChange: $value');
      },
      decoration: InputDecoration(
        alignLabelWithHint: true,
        fillColor: ColorConstants.backgroundTextInput,
        filled: true,
        labelStyle: const TextStyle(color: ColorConstants.primaryText),
        helperText: widget.helperText,
        errorText: errorText,
        label: Container(
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: ColorConstants.backgroundTextInput,
            border:
                Border.all(color: ColorConstants.backgroundTextInput, width: 1),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(widget.labelText),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide:
              const BorderSide(color: ColorConstants.backgroundTextInput),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide:
              const BorderSide(color: ColorConstants.backgroundTextInput),
          borderRadius: BorderRadius.circular(8.0),
        ),
        disabledBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide:
              const BorderSide(color: ColorConstants.backgroundTextInput),
          borderRadius: BorderRadius.circular(8.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
              color: errorText != null
                  ? ColorConstants.error
                  : ColorConstants.backgroundTextInput),
        ),
      ),
    );
  }

  List<TextInputFormatter> _getFormatter() {
    return [
      FilteringTextInputFormatter.allow(widget.regExp ?? defaultRegExp),
      LengthLimitingTextInputFormatter(20),
    ];
  }
}
