import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/base/widgets/base_widget.dart';
import 'package:ecommerceflutterapp/core/components/textfields/base_input.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BaseView(
      onModelReady: (value) {},
      onPageBuilder: (context, value) {
        return BaseInput();
      },
    ));
  }
}
