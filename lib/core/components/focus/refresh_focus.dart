import 'package:flutter/material.dart';

class RefreshFocus extends StatelessWidget {
  final Widget child;

  const RefreshFocus({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: child,
    );
  }
}
