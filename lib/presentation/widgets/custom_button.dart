import 'package:airplane_price/config/constants/color_constants.dart';
import 'package:airplane_price/config/constants/style_contants.dart';
import 'package:flutter/material.dart';

class CustomMainButton extends StatefulWidget {
  final String _text;
  final Color? _color;
  final Future<void> Function()? _onPressed;
  final EdgeInsetsGeometry _margin;
  final double _buttonRoundCorner;
  final bool _enabled;
  final double _horizontalPadding;

  const CustomMainButton({
    super.key,
    required String text,
    Color? color,
    Future<void> Function()? onPressed,
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(horizontal: 16),
    ValueNotifier<bool>? loadingListener,
    double buttonRoundCorner = 16,
    bool enabled = true,
    double horizontalPadding = 24,
    String? iconPath,
    List<String>? iconsPath,
  })  : _horizontalPadding = horizontalPadding,
        _enabled = enabled,
        _buttonRoundCorner = buttonRoundCorner,
        _margin = margin,
        _onPressed = onPressed,
        _text = text,
        _color = color ?? Colors.blue;

  @override
  State<CustomMainButton> createState() => _CustomMainButtonState();
}

class _CustomMainButtonState extends State<CustomMainButton> {
  @override
  Widget build(BuildContext context) {
    final Color? colorButton = !widget._enabled
        ? ColorConstants.backgroundEnableButton
        : (widget._onPressed != null
            ? widget._color
            : ColorConstants.backgroundDisableButton);

    return Container(
      width: double.infinity,
      margin: widget._margin,
      child: ElevatedButton(
        onPressed: widget._onPressed == null
            ? null
            : widget._enabled
                ? widget._onPressed!
                : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colorButton),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget._buttonRoundCorner),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 12.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widget._horizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget._text,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: widget._onPressed != null
                      ? StyleConstants.mainButtonTextStyle
                      : StyleConstants.mainButtonDisabledTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
