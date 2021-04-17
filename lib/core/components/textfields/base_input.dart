import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/base/widgets/base_widget.dart';
import 'package:ecommerceflutterapp/core/constants/app/app_constants.dart';
import 'package:ecommerceflutterapp/core/constants/component/input_constants.dart';
import 'package:ecommerceflutterapp/core/init/theme/colors.dart';
import 'package:flutter/material.dart';

class BaseInput extends StatefulWidget {
  final Widget? icon;
  final String? placeholder;

  const BaseInput({Key? key, this.icon, this.placeholder}) : super(key: key);
  @override
  _BaseInputState createState() => _BaseInputState();
}

class _BaseInputState extends BaseState<BaseInput> {
  Widget textField() {
    BorderRadius borderRadius =
        BorderRadius.all(Radius.circular(dynamicWidth(0.03)));

    double borderWidth = dynamicWidth(0.0055);
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: borderRadius,
      ),
      child: TextField(
        cursorColor: black,
        style: TextStyle(
            fontSize: dynamicWidth(ApplicationConstants.TEXT_HEADER_M)),
        decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: TextStyle(color: grey),
            prefixIcon: widget.icon,
            contentPadding: EdgeInsets.symmetric(
                horizontal: dynamicWidth(0.04), vertical: dynamicHeight(0.02)),
            enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: grey, width: borderWidth)),
            focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: black, width: borderWidth))),
      ),
    );
  }

  Widget inputContainer() {
    return Container(
      width: dynamicWidth(InputConstants.LARGE_INPUT_WIDTH),
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
