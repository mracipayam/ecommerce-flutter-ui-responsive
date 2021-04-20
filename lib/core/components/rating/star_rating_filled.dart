import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/constants/app/app_constants.dart';
import 'package:ecommerceflutterapp/core/init/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarFilledRating extends StatefulWidget {
  final double width;

  const StarFilledRating({Key? key, this.width = 0.0410}) : super(key: key);
  @override
  _StarFilledRatingState createState() => _StarFilledRatingState();
}

class _StarFilledRatingState extends BaseState<StarFilledRating> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      ApplicationConstants.SVG_PATH + "star-filled.svg",
      width: dynamicWidth(widget.width),
      color: accent,
    );
  }
}
