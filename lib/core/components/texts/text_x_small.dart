import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../base/state/base_state.dart';
import '../../constants/app/app_constants.dart';

class TextXSmall extends StatefulWidget {
  final String text;
  final Color? color;
  final TextStyle? style;
  final FontWeight? weight;

  const TextXSmall(
      {Key? key,
      required this.text,
      this.color,
      this.style,
      this.weight = FontWeight.w400})
      : super(key: key);
  @override
  _TextXSmallState createState() => _TextXSmallState();
}

class _TextXSmallState extends BaseState<TextXSmall> {
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      widget.text,
      style: widget.style == null
          ? TextStyle(
              fontSize: dynamicWidth(ApplicationConstants.TEXT_HEADER_XS),
              fontWeight: widget.weight,
              color: widget.color)
          : widget.style,
    );
  }
}
