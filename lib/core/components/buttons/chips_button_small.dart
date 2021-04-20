import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_medium.dart';
import 'package:ecommerceflutterapp/core/constants/component/button_constants.dart';
import 'package:ecommerceflutterapp/core/init/theme/colors.dart';
import 'package:flutter/material.dart';

class ChipsSmallButton extends StatefulWidget {
  final bool selected;
  final String buttonText;

  const ChipsSmallButton(
      {Key? key, required this.selected, required this.buttonText})
      : super(key: key);

  @override
  _ChipsSmallButtonState createState() => _ChipsSmallButtonState();
}

class _ChipsSmallButtonState extends BaseState<ChipsSmallButton> {
  Widget buttonContainer() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: widget.selected ? primary : white,
          border: Border.all(
              color: widget.selected ? primary : grey,
              width: dynamicWidth(0.0045)),
          borderRadius: BorderRadius.all(Radius.circular(
              dynamicWidth(ButtonConstants.BUTTON_BORDER_RADIUS)))),
      width: dynamicWidth(ButtonConstants.FILTER_BUTTON_WIDTH),
      height: dynamicHeight(ButtonConstants.FILTER_BUTTON_HEIGHT),
      child: TextMedium(
        text: widget.buttonText,
        color: widget.selected ? white : black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buttonContainer();
  }
}
