import '../../base/state/base_state.dart';
import '../texts/text_large.dart';
import '../../constants/component/button_constants.dart';
import '../../init/theme/colors.dart';
import 'package:flutter/material.dart';

class ButtonLarge extends StatefulWidget {
  final String text;
  final void Function()? onTap;

  const ButtonLarge({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  @override
  _ButtonLargeState createState() => _ButtonLargeState();
}

class _ButtonLargeState extends BaseState<ButtonLarge> {
  Widget buttonContainer(Widget child) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.all(Radius.circular(
              dynamicWidth(ButtonConstants.BUTTON_BORDER_RADIUS)))),
      width: dynamicWidth(ButtonConstants.LARGE_BUTTON_WIDTH),
      height: dynamicHeight(ButtonConstants.LARGE_BUTTON_HEIGHT),
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
      color: white,
    );
  }

  Widget button() {
    return buttonContainer(buttonInkWell(buttonText()));
  }

  @override
  Widget build(BuildContext context) {
    return button();
  }
}
