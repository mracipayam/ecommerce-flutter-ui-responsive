import '../../constants/app/app_constants.dart';
import '../../init/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../base/state/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarBase extends StatefulWidget implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(50);
  @override
  _AppBarBaseState createState() => _AppBarBaseState();
}

class _AppBarBaseState extends BaseState<AppBarBase> {
  Widget leadingButton() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(dynamicWidth(0.032)),
        child: SvgPicture.asset(
          ApplicationConstants.SVG_PATH + "menu-variant.svg",
        ),
      ),
    );
  }

  Widget actionButton() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(right: dynamicWidth(0.02)),
        child: CircleAvatar(
            backgroundColor: white,
            child: ClipOval(
              child: Image.asset(
                ApplicationConstants.AVATARS_PATH + "avatar.webp",
                width: dynamicWidth(ApplicationConstants.AVATAR_SMALL),
                height: dynamicWidth(ApplicationConstants.AVATAR_SMALL),
              ),
            )),
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
      title: Image.asset(
        ApplicationConstants.LOGOS_PATH + "logo.webp",
        width: dynamicWidth(0.212),
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
