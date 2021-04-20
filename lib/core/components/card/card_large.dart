import '../../base/state/base_state.dart';
import '../../constants/component/card_constants.dart';
import '../../init/theme/colors.dart';
import 'package:flutter/material.dart';

class CardLarge extends StatefulWidget {
  final Widget child;

  const CardLarge({Key? key, required this.child}) : super(key: key);
  @override
  _CardLargeState createState() => _CardLargeState();
}

class _CardLargeState extends BaseState<CardLarge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dynamicWidth(CardConstants.LARGE_CARD_HEIGHT),
      width: dynamicWidth(CardConstants.LARGE_CARD_WIDTH),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(Radius.circular(
              dynamicWidth(CardConstants.LARGE_CARD_BORDER_RADIUS)))),
      child: widget.child,
    );
  }
}
