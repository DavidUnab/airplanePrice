import 'package:airplane_price/config/constants/color_constants.dart';
import 'package:flutter/material.dart';

class StyleConstants {
  static TextStyle mainButtonTextStyle = const TextStyle(
    color: ColorConstants.enableTextButton,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle mainButtonDisabledTextStyle = const TextStyle(
    color: ColorConstants.disableTextButton,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle configTitleTextStyle = const TextStyle(
    color: ColorConstants.primaryText,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static TextStyle labelTextStyle = const TextStyle(
    color: ColorConstants.primaryText,
    fontSize: 16,
  );

  static TextStyle labelDropdownTextStyle = const TextStyle(
    color: ColorConstants.primaryText,
    fontSize: 16,
  );

  static TextStyle helperTextStyle = const TextStyle(
    color: ColorConstants.primaryText,
    fontSize: 12,
  );

  static TextStyle helperErrorTextStyle = const TextStyle(
    color: ColorConstants.error,
    fontSize: 12,
  );

  static TextStyle dialogTitleTextStyle = const TextStyle(
    color: ColorConstants.primaryText,
    fontSize: 16,
  );

  static TextStyle dialogDescriptionTextStyle = const TextStyle(
    color: ColorConstants.secondaryText,
    fontSize: 14,
  );
}
