import 'package:ecommerceflutterapp/core/constants/app/app_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../base/state/base_state.dart';
import '../texts/text_medium.dart';
import '../../constants/component/button_constants.dart';
import '../../init/theme/colors.dart';
import 'package:flutter/material.dart';

class ButtonFilter extends StatefulWidget {
  final void Function()? onTap;
  static dynamic onTapDefault() {}

  const ButtonFilter({
    Key? key,
    this.onTap = onTapDefault,
  }) : super(key: key);
  @override
  _ButtonFilterState createState() => _ButtonFilterState();
}

class _ButtonFilterState extends BaseState<ButtonFilter> {
  Widget buttonContainer(Widget child) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: white,
          border: Border.all(color: grey, width: dynamicWidth(0.0045)),
          borderRadius: BorderRadius.all(Radius.circular(
              dynamicWidth(ButtonConstants.BUTTON_BORDER_RADIUS)))),
      width: dynamicWidth(ButtonConstants.FILTER_BUTTON_WIDTH),
      height: dynamicHeight(ButtonConstants.FILTER_BUTTON_HEIGHT),
      child: Row(
        children: [
          svgFilterIcon(),
          child,
        ],
      ),
    );
  }

  Widget svgFilterIcon() {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(0.0384)),
      child: SvgPicture.asset(
        ApplicationConstants.SVG_PATH + "sliders.svg",
        width: dynamicWidth(0.0412),
      ),
    );
  }

  Widget buttonInkWell(Widget child) {
    return InkWell(
      onTap: widget.onTap,
      child: child,
    );
  }

  Widget buttonText() {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(0.0105)),
      child: TextMedium(
        text: "Filter",
      ),
    );
  }

  Widget button() {
    return buttonInkWell(buttonContainer(buttonText()));
  }

  @override
  Widget build(BuildContext context) {
    return button();
  }
}
