import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../base/state/base_state.dart';
import '../../constants/app/app_constants.dart';
import '../../init/theme/colors.dart';

class AppBarBackCart extends StatefulWidget implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(50);
  @override
  _AppBarBackCartState createState() => _AppBarBackCartState();
}

class _AppBarBackCartState extends BaseState<AppBarBackCart> {
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
      title: Container(),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
