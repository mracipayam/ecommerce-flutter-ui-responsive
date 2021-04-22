import 'package:ecommerceflutterapp/core/components/texts/text_medium.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../base/state/base_state.dart';
import '../../constants/app/app_constants.dart';
import '../../init/theme/colors.dart';

class AppBarProfile extends StatefulWidget implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(50);
  @override
  _AppBarProfileState createState() => _AppBarProfileState();
}

class _AppBarProfileState extends BaseState<AppBarProfile> {
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

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backwardsCompatibility: false,
      backgroundColor: white,
      elevation: 0,
      centerTitle: true,
      leading: leadingButton(),
      title: TextMedium(
        text: "Profile",
        weight: FontWeight.bold,
        color: black,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
