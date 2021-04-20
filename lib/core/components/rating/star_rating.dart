import '../../base/state/base_state.dart';
import '../../constants/app/app_constants.dart';
import '../../init/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarRating extends StatefulWidget {
  final double width;

  const StarRating({Key? key, this.width = 0.0410}) : super(key: key);
  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends BaseState<StarRating> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      ApplicationConstants.SVG_PATH + "star.svg",
      width: dynamicWidth(widget.width),
      color: black,
    );
  }
}
