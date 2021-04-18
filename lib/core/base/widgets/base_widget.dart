import '../state/base_state.dart';
import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  final Widget Function(BuildContext context) onPageBuilder;
  final bool safeArea;
  final ScrollPhysics? scrollPhysics;

  const BaseView({
    Key? key,
    this.safeArea = true,
    this.scrollPhysics,
    required this.onPageBuilder,
  }) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T> extends BaseState<BaseView<T>> {
  Widget scrollWidget(Widget child) {
    return SingleChildScrollView(
      physics: widget.scrollPhysics == null
          ? BouncingScrollPhysics()
          : widget.scrollPhysics,
      child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: child),
    );
  }

  Widget safeAreaWidget(Widget child) {
    return SafeArea(child: child);
  }

  @override
  Widget build(BuildContext context) {
    return widget.safeArea
        ? safeAreaWidget(scrollWidget(widget.onPageBuilder(context)))
        : scrollWidget(widget.onPageBuilder(context));
  }
}
