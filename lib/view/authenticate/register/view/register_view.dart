import 'package:ecommerceflutterapp/core/components/buttons/button_logo.dart';
import 'package:ecommerceflutterapp/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/widgets/base_widget.dart';
import '../../../../core/components/buttons/button_large.dart';
import '../../../../core/components/svg/svg_input_icon.dart';
import '../../../../core/components/textfields/base_input.dart';
import '../../../../core/components/texts/text_custom.dart';
import '../../../../core/components/texts/text_small.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/init/theme/colors.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends BaseState<RegisterView> {
  bool inputFocusEmail = false;
  bool inputFocusPassword = false;

  void inputFocusChangeEmail(bool hasFocus) {
    setState(() {
      inputFocusEmail = hasFocus;
    });
  }

  void inputFocusChangePassword(bool hasFocus) {
    setState(() {
      inputFocusPassword = hasFocus;
    });
  }

  Widget registerViewContainer(Widget child) {
    return Container(
        height: dynamicHeight(1),
        width: dynamicWidth(1),
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(ApplicationConstants.IMAGES_PATH +
                    "auth_background.webp"))),
        child: child);
  }

  Widget annotatedRegion(Widget child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
      child: child,
    );
  }

  Widget signInHereText() {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigateToPageClear(path: "/login");
      },
      child: TextSmall(
        text: "Sign In here",
        style: TextStyle(
            fontSize: dynamicWidth(ApplicationConstants.TEXT_HEADER_S),
            color: primary,
            decoration: TextDecoration.underline),
      ),
    );
  }

  Widget haveAccountText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextSmall(
          text: "If you have an account? ",
          color: white,
        ),
        signInHereText()
      ],
    );
  }

  Widget buttonApple() {
    return ButtonLogo(logoName: "apple.webp");
  }

  Widget buttonFacebook() {
    return ButtonLogo(logoName: "facebook.webp");
  }

  Widget buttonGoogle() {
    return ButtonLogo(logoName: "google.webp");
  }

  Widget socialSignInRow() {
    return Container(
      width: dynamicWidth(0.476),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [buttonApple(), buttonFacebook(), buttonGoogle()],
      ),
    );
  }

  Widget registerForm() {
    return Column(
      children: [
        BaseInput(
          placeholder: "Email",
          icon: SvgInputIcon(
            svgName: "mail.svg",
          ),
          onFocusChange: (hasFocus) => inputFocusChangeEmail(hasFocus),
        ),
        BaseInput(
          placeholder: "Password",
          icon: SvgInputIcon(
            svgName: "lock.svg",
          ),
          onFocusChange: (hasFocus) => inputFocusChangePassword(hasFocus),
        ),
        SizedBox(
          height: dynamicHeight(0.026),
        ),
        ButtonLarge(
            text: "Sign Up",
            onTap: () =>
                NavigationService.instance.navigateToPage(path: "/register")),
        SizedBox(
          height: dynamicHeight(0.055),
        ),
        socialSignInRow(),
        SizedBox(
          height: dynamicHeight(0.0315),
        ),
        haveAccountText()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView(
        scrollPhysics: ClampingScrollPhysics(),
        safeArea: false,
        onPageBuilder: (context) {
          return annotatedRegion(
            registerViewContainer(
              Column(
                children: [
                  SizedBox(
                    height: dynamicHeight(0.14),
                  ),
                  TextCustom(
                    text: "Audio",
                    color: white,
                    weight: FontWeight.w700,
                    size: 0.13,
                  ),
                  TextSmall(
                    text: "It's modular and designed to last",
                    color: white,
                  ),
                  inputFocusEmail || inputFocusPassword
                      ? Container()
                      : SizedBox(
                          height: dynamicHeight(0.21),
                        ),
                  registerForm(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
