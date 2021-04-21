import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/constants/app/app_constants.dart';
import 'package:flutter/material.dart';

class AvatarSmall extends StatefulWidget {
  @override
  _AvatarSmallState createState() => _AvatarSmallState();
}

class _AvatarSmallState extends BaseState<AvatarSmall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: dynamicWidth(0.102),
      child: CircleAvatar(
        backgroundImage: AssetImage(
          ApplicationConstants.AVATARS_PATH + "avatar.webp",
        ),
      ),
    );
  }
}
