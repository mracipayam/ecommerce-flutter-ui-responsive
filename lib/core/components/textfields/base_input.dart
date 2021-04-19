import '../../base/state/base_state.dart';
import '../../base/widgets/base_widget.dart';
import '../../constants/app/app_constants.dart';
import '../../constants/component/input_constants.dart';
import '../../init/theme/colors.dart';
import 'package:flutter/material.dart';

class BaseInput extends StatefulWidget {
  final Widget? icon;
  final String? placeholder;
  final void Function(bool hasFocus) onFocusChange;
  final bool secureText;

  static dynamic _dummyOnFocusChange(bool val) {}

  BaseInput(
      {Key? key,
      this.icon,
      this.placeholder,
      this.onFocusChange = _dummyOnFocusChange,
      this.secureText = false})
      : super(key: key);
  @override
  _BaseInputState createState() => _BaseInputState();
}

class _BaseInputState extends BaseState<BaseInput> {
  Widget textField() {
    BorderRadius borderRadius = BorderRadius.all(
        Radius.circular(dynamicWidth(InputConstants.INPUT_BORDER_RADIUS)));

    double borderWidth = dynamicWidth(0.0055);
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: borderRadius,
      ),
      child: Focus(
        onFocusChange: (hasFocus) {
          widget.onFocusChange(hasFocus);
        },
        child: TextField(
          cursorColor: black,
          obscureText: widget.secureText,
          style: TextStyle(
              fontSize: dynamicWidth(ApplicationConstants.TEXT_HEADER_S)),
          decoration: InputDecoration(
              hintText: widget.placeholder,
              hintStyle: TextStyle(color: grey),
              prefixIcon: widget.icon,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: dynamicWidth(0.04),
                  vertical: dynamicHeight(0.022)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(color: grey, width: borderWidth)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide(color: black, width: borderWidth))),
        ),
      ),
    );
  }

  Widget inputContainer() {
    return Container(
      width: dynamicWidth(InputConstants.LARGE_INPUT_WIDTH),
      height: dynamicHeight(InputConstants.LARGE_INPUT_HEIGHT),
      child: textField(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onPageBuilder: (context) {
        return inputContainer();
      },
    );
  }
}
