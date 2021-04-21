import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/components/rating/star_rating.dart';
import 'package:ecommerceflutterapp/core/components/rating/star_rating_filled.dart';
import 'package:flutter/material.dart';

class StarRatingFive extends StatefulWidget {
  final int rate;

  const StarRatingFive({Key? key, required this.rate}) : super(key: key);
  @override
  _StarRatingFiveState createState() => _StarRatingFiveState();
}

class _StarRatingFiveState extends BaseState<StarRatingFive> {
  List<Widget> stars = [];

  @override
  void initState() {
    super.initState();
    if (widget.rate <= 0) {
      stars = [
        StarRating(),
        StarRating(),
        StarRating(),
        StarRating(),
        StarRating(),
      ];
    } else if (widget.rate == 1) {
      stars = [
        StarFilledRating(),
        StarRating(),
        StarRating(),
        StarRating(),
        StarRating(),
      ];
    } else if (widget.rate == 2) {
      stars = [
        StarFilledRating(),
        StarFilledRating(),
        StarRating(),
        StarRating(),
        StarRating(),
      ];
    } else if (widget.rate == 3) {
      stars = [
        StarFilledRating(),
        StarFilledRating(),
        StarFilledRating(),
        StarRating(),
        StarRating(),
      ];
    } else if (widget.rate == 4) {
      stars = [
        StarFilledRating(),
        StarFilledRating(),
        StarFilledRating(),
        StarFilledRating(),
        StarRating(),
      ];
    } else if (widget.rate == 5) {
      stars = [
        StarFilledRating(),
        StarFilledRating(),
        StarFilledRating(),
        StarFilledRating(),
        StarFilledRating(),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int index = 0; index <= stars.length - 1; index++)
          Row(
            children: [
              stars[index],
              SizedBox(
                width: dynamicWidth(0.01),
              )
            ],
          )
      ],
    );
  }
}
