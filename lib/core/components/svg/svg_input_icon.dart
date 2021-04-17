import '../../base/state/base_state.dart';
import '../../constants/app/app_constants.dart';
import '../../init/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgInputIcon extends StatefulWidget {
  final String svgName;

  const SvgInputIcon({Key? key, required this.svgName}) : super(key: key);
  @override
  _SvgInputIconState createState() => _SvgInputIconState();
}

class _SvgInputIconState extends BaseState<SvgInputIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(dynamicWidth(0.03)),
      child: SvgPicture.asset(
        ApplicationConstants.SVG_PATH + widget.svgName,
        color: grey,
      ),
    );
  }
}
