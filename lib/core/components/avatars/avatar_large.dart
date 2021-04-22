import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/constants/app/app_constants.dart';
import 'package:flutter/material.dart';

class AvatarLarge extends StatefulWidget {
  @override
  _AvatarLargeState createState() => _AvatarLargeState();
}

class _AvatarLargeState extends BaseState<AvatarLarge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: dynamicWidth(0.192),
      height: dynamicWidth(0.192),
      child: CircleAvatar(
        backgroundImage: AssetImage(
          ApplicationConstants.AVATARS_PATH + "avatar.webp",
        ),
      ),
    );
  }
}
