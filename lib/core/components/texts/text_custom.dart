import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../base/state/base_state.dart';
import '../../constants/app/app_constants.dart';

class TextCustom extends StatefulWidget {
  final String text;
  final Color? color;
  final FontWeight? weight;
  final TextStyle? style;
  final double size;

  const TextCustom(
      {Key? key,
      required this.text,
      this.color,
      this.style,
      this.weight = FontWeight.w400,
      this.size = ApplicationConstants.TEXT_HEADER_S})
      : super(key: key);
  @override
  _TextCustomState createState() => _TextCustomState();
}

class _TextCustomState extends BaseState<TextCustom> {
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      widget.text,
      style: widget.style == null
          ? TextStyle(
              fontSize: dynamicWidth(widget.size),
              color: widget.color,
              fontWeight: widget.weight)
          : widget.style,
    );
  }
}
