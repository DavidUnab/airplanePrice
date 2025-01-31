import 'package:airplane_price/config/constants/color_constants.dart';
import 'package:airplane_price/config/constants/style_contants.dart';
import 'package:airplane_price/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomFloatingWidget extends StatelessWidget {
  final String title;
  final String description;
  final String? buttonText;
  final Color? borderColor;
  final Future<void> Function()? onButtonPressed;
  final Function()? onClosePressed;
  final String? iconPath;

  const CustomFloatingWidget({
    super.key,
    required this.title,
    required this.description,
    this.buttonText,
    this.borderColor,
    this.onButtonPressed,
    this.onClosePressed,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.backgroundTextInput,
        border: Border.all(
          color: ColorConstants.backgroundTextInput,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(24.0),
      ),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContent(),
          buttonText != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomMainButton(
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    text: buttonText ?? '',
                    onPressed: () async {
                      await onButtonPressed?.call();
                    },
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  _buildContent() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(title, style: StyleConstants.dialogTitleTextStyle),
                  const SizedBox(height: 10),
                  Text(description,
                      style: StyleConstants.dialogDescriptionTextStyle),
                ],
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                onClosePressed?.call();
              },
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.close, color: Colors.white),
              ),
            ),
          ]),
    );
  }
}
