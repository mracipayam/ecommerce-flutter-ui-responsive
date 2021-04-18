import 'package:ecommerceflutterapp/core/constants/app/app_constants.dart';

import '../../base/state/base_state.dart';
import '../texts/text_large.dart';
import '../../constants/component/button_constants.dart';
import '../../init/theme/colors.dart';
import 'package:flutter/material.dart';

class ButtonLogo extends StatefulWidget {
  final String logoName;
  final void Function()? onTap;
  static dynamic onTapDefault() {}
  const ButtonLogo({
    Key? key,
    required this.logoName,
    this.onTap = onTapDefault,
  }) : super(key: key);
  @override
  _ButtonLogoState createState() => _ButtonLogoState();
}

class _ButtonLogoState extends BaseState<ButtonLogo> {
  Widget buttonContainer(Widget child) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(Radius.circular(
              dynamicWidth(ButtonConstants.BUTTON_BORDER_RADIUS)))),
      width: dynamicWidth(ButtonConstants.LOGO_BUTTON_WIDTH),
      height: dynamicWidth(ButtonConstants.LOGO_BUTTON_HEIGHT),
      child: child,
    );
  }

  Widget buttonInkWell(Widget child) {
    return InkWell(
      onTap: widget.onTap,
      child: child,
    );
  }

  Widget buttonLogo() {
    return Image.asset(
      ApplicationConstants.LOGOS_PATH + widget.logoName,
      width: dynamicWidth(0.048),
    );
  }

  Widget button() {
    return buttonContainer(buttonInkWell(buttonLogo()));
  }

  @override
  Widget build(BuildContext context) {
    return button();
  }
}
