import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/constants/component/card_constants.dart';
import 'package:ecommerceflutterapp/core/init/theme/colors.dart';
import 'package:flutter/material.dart';

class CardCommentPhoto extends StatefulWidget {
  final Widget child;

  const CardCommentPhoto({Key? key, required this.child}) : super(key: key);

  @override
  _CardCommentPhotoState createState() => _CardCommentPhotoState();
}

class _CardCommentPhotoState extends BaseState<CardCommentPhoto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: dynamicWidth(CardConstants.CARD_COMMENT_PHOTO_WIDTH),
      height: dynamicWidth(CardConstants.CARD_COMMENT_PHOTO_HEIGHT),
      decoration: BoxDecoration(
          border: Border.all(color: grey, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(
              dynamicWidth(CardConstants.LARGE_CARD_BORDER_RADIUS)))),
      child: widget.child,
    );
  }
}
