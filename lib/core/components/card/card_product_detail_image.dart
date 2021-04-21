import '../../base/state/base_state.dart';
import '../../constants/component/card_constants.dart';
import '../../init/theme/colors.dart';
import 'package:flutter/material.dart';

class CardProductDetailImage extends StatefulWidget {
  final Widget child;

  const CardProductDetailImage({Key? key, required this.child})
      : super(key: key);
  @override
  _CardProductDetailImageState createState() => _CardProductDetailImageState();
}

class _CardProductDetailImageState extends BaseState<CardProductDetailImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dynamicHeight(CardConstants.PRODUCT_DETAIL_IMAGE_CARD_HEIGHT),
      width: dynamicWidth(CardConstants.PRODUCT_DETAIL_IMAGE_CARD_WIDTH),
      decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(
              dynamicWidth(CardConstants.LARGE_CARD_BORDER_RADIUS)))),
      child: widget.child,
    );
  }
}
