import 'package:ecommerceflutterapp/core/constants/app/app_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../base/state/base_state.dart';
import '../texts/text_medium.dart';
import '../../constants/component/button_constants.dart';
import '../../init/theme/colors.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatefulWidget {
  final String text;
  final String iconName;
  final void Function()? onTap;
  static dynamic onTapDefault() {}

  const ButtonText({
    Key? key,
    required this.text,
    this.iconName = "",
    this.onTap = onTapDefault,
  }) : super(key: key);
  @override
  _ButtonTextState createState() => _ButtonTextState();
}

class _ButtonTextState extends BaseState<ButtonText> {
  Widget buttonRow() {
    return Row(
      children: [
        buttonContainer(buttonText()),
        widget.iconName.length != 0
            ? SvgPicture.asset(
                ApplicationConstants.SVG_PATH + widget.iconName,
                color: primary,
              )
            : Container()
      ],
    );
  }

  Widget buttonContainer(Widget child) {
    return Container(
      alignment: Alignment.centerLeft,
      color: transparent,
      width: dynamicWidth(ButtonConstants.TEXT_BUTTON_WIDTH),
      height: dynamicHeight(ButtonConstants.TEXT_BUTTON_HEIGHT),
      child: child,
    );
  }

  Widget buttonInkWell(Widget child) {
    return InkWell(
      onTap: widget.onTap,
      child: child,
    );
  }

  Widget buttonText() {
    return TextMedium(
      text: widget.text,
      weight: FontWeight.bold,
      color: primary,
    );
  }

  Widget button() {
    return buttonInkWell(buttonRow());
  }

  @override
  Widget build(BuildContext context) {
    return button();
  }
}
