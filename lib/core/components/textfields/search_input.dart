import '../../base/state/base_state.dart';
import '../../base/widgets/base_widget.dart';
import '../../constants/app/app_constants.dart';
import '../../constants/component/input_constants.dart';
import '../../init/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchInput extends StatefulWidget {
  final String? placeholder;
  final void Function(bool hasFocus) onFocusChange;

  static dynamic _dummyOnFocusChange(bool val) {}
  const SearchInput(
      {Key? key, this.placeholder, this.onFocusChange = _dummyOnFocusChange})
      : super(key: key);

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends BaseState<SearchInput> {
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
          style: TextStyle(
              fontSize: dynamicWidth(ApplicationConstants.TEXT_HEADER_S)),
          decoration: InputDecoration(
              hintText: widget.placeholder,
              hintStyle: TextStyle(color: grey),
              prefixIcon: Padding(
                padding: EdgeInsets.all(dynamicWidth(0.03)),
                child: SvgPicture.asset(
                  ApplicationConstants.SVG_PATH + "search.svg",
                  color: grey,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: dynamicWidth(0.04),
                  vertical: dynamicHeight(0.02)),
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
