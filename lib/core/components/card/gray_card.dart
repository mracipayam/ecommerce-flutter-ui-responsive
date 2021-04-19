import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/init/theme/colors.dart';
import 'package:flutter/material.dart';

class GrayCard extends StatefulWidget {
  final Widget child;

  const GrayCard({Key? key, required this.child}) : super(key: key);
  @override
  _GrayCardState createState() => _GrayCardState();
}

class _GrayCardState extends BaseState<GrayCard> {
  double cardRadius = 0.077;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: dynamicWidth(1),
      constraints: BoxConstraints(minHeight: dynamicHeight(0.726)),
      decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(dynamicWidth(cardRadius)),
              topRight: Radius.circular(dynamicWidth(cardRadius)))),
      child: widget.child,
    );
  }
}
