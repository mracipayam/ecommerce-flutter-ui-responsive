import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/constants/component/card_constants.dart';
import 'package:ecommerceflutterapp/core/init/theme/colors.dart';
import 'package:flutter/material.dart';

class CardSmall extends StatefulWidget {
  final Widget child;

  const CardSmall({Key? key, required this.child}) : super(key: key);
  @override
  _CardSmallState createState() => _CardSmallState();
}

class _CardSmallState extends BaseState<CardSmall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dynamicWidth(CardConstants.SMALL_CARD_HEIGHT),
      width: dynamicWidth(CardConstants.SMALL_CARD_WIDTH),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(Radius.circular(
              dynamicWidth(CardConstants.LARGE_CARD_BORDER_RADIUS)))),
      child: widget.child,
    );
  }
}
