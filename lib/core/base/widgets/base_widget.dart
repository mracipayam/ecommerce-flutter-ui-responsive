import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final Function(T model) onModelReady;
  final VoidCallback onDispose;

  const BaseView(
      {Key key,
      this.viewModel,
      @required this.onPageBuilder,
      @required this.onModelReady,
      this.onDispose})
      : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T> extends BaseState<BaseView<T>> {
  T model;

  Widget scrollWidget(Widget child) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: dynamicHeight(1)),
        child: child,
      ),
    );
  }

  Widget safeArea(Widget child) {
    return SafeArea(child: child);
  }

  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose();
  }

  @override
  Widget build(BuildContext context) {
    return safeArea(scrollWidget(widget.onPageBuilder(context, model)));
  }
}
