import '../../base/state/base_state.dart';
import '../../constants/component/card_constants.dart';
import '../../init/theme/colors.dart';
import 'package:flutter/material.dart';

class CardFitLarge extends StatefulWidget {
  final Widget child;

  const CardFitLarge({Key? key, required this.child}) : super(key: key);
  @override
  _CardFitLargeState createState() => _CardFitLargeState();
}

class _CardFitLargeState extends BaseState<CardFitLarge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dynamicWidth(CardConstants.LARGE_CARD_FIT_HEIGHT),
      width: dynamicWidth(CardConstants.LARGE_CARD_FIT_WIDTH),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(Radius.circular(
              dynamicWidth(CardConstants.LARGE_CARD_BORDER_RADIUS)))),
      child: widget.child,
    );
  }
}
