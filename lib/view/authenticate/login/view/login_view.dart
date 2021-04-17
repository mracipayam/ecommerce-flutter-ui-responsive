import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/base/widgets/base_widget.dart';
import 'package:ecommerceflutterapp/core/components/appbars/appbar_transparent.dart';
import 'package:ecommerceflutterapp/core/components/textfields/base_input.dart';
import 'package:ecommerceflutterapp/core/components/textfields/search_input.dart';
import 'package:ecommerceflutterapp/core/constants/app/app_constants.dart';
import 'package:ecommerceflutterapp/core/init/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  Widget loginViewContainer(Widget child) {
    return Container(
        height: dynamicHeight(1),
        width: dynamicWidth(1),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(ApplicationConstants.IMAGES_PATH +
                    "auth_background.webp"))),
        child: child);
  }

  Widget textLogo() {
    return Text(
      "Audio",
      style: TextStyle(
          color: white,
          fontWeight: FontWeight.bold,
          fontSize: dynamicWidth(ApplicationConstants.TEXT_HEADER_L)),
    );
  }

  Widget annotatedRegion(Widget child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
      child: child,
    );
  }

  Widget textSlogan() {
    return Text(
      "It's modular and designed to last",
      style: TextStyle(
          color: white,
          fontSize: dynamicWidth(ApplicationConstants.TEXT_HEADER_S)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView(
        safeArea: false,
        onPageBuilder: (context) {
          return annotatedRegion(
            loginViewContainer(
              Column(
                children: [
                  textLogo(),
                  textSlogan(),
                  BaseInput(
                    placeholder: "asdfsaf",
                  ),
                  SearchInput()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
