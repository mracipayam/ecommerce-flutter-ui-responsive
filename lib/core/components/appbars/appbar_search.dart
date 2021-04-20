import 'package:ecommerceflutterapp/core/components/texts/text_medium.dart';
import 'package:ecommerceflutterapp/core/constants/app/app_constants.dart';
import 'package:ecommerceflutterapp/core/init/navigation/navigation_service.dart';
import 'package:ecommerceflutterapp/core/init/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../base/state/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarSearch extends StatefulWidget implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(50);
  @override
  _AppBarSearchState createState() => _AppBarSearchState();
}

class _AppBarSearchState extends BaseState<AppBarSearch> {
  Widget leadingButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.all(dynamicWidth(0.032)),
        child: SvgPicture.asset(
          ApplicationConstants.SVG_PATH + "chevron-left.svg",
        ),
      ),
    );
  }

  Widget actionButton() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(dynamicWidth(0.032)),
        child: SvgPicture.asset(
          ApplicationConstants.SVG_PATH + "shopping-cart.svg",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backwardsCompatibility: false,
      backgroundColor: white,
      elevation: 0,
      centerTitle: true,
      leading: leadingButton(),
      actions: [actionButton()],
      title: TextMedium(
        text: "Search",
        color: black,
        weight: FontWeight.bold,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
