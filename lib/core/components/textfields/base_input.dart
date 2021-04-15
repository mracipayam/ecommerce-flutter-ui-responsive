import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/base/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class BaseInput extends StatefulWidget {
  @override
  _BaseInputState createState() => _BaseInputState();
}

class _BaseInputState extends BaseState<BaseInput> {
  Widget textField() {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(dynamicWidth(0.03))),
              borderSide: BorderSide(color: Colors.grey))),
    );
  }

  Widget inputContainer() {
    return Container(
      width: dynamicWidth(0.94),
      child: textField(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onModelReady: (value) {},
      onPageBuilder: (context, value) {
        return inputContainer();
      },
    );
  }
}
