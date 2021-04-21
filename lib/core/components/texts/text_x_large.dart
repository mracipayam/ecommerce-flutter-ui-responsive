import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../base/state/base_state.dart';
import '../../constants/app/app_constants.dart';

class TextXLarge extends StatefulWidget {
  final String text;
  final Color? color;
  final FontWeight? weight;
  final TextStyle? style;

  const TextXLarge(
      {Key? key,
      required this.text,
      this.color,
      this.style,
      this.weight = FontWeight.w400})
      : super(key: key);
  @override
  _TextXLargeState createState() => _TextXLargeState();
}

class _TextXLargeState extends BaseState<TextXLarge> {
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      widget.text,
      style: widget.style == null
          ? TextStyle(
              fontSize: dynamicWidth(ApplicationConstants.TEXT_HEADER_XL),
              color: widget.color,
              fontWeight: widget.weight)
          : widget.style,
    );
  }
}
