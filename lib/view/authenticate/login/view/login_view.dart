import 'package:ecommerceflutterapp/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  bool inputFocusEmail = false;
  bool inputFocusPassword = false;
  double sizedBoxHeight = 50;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration.zero,
        () => {
              setState(() {
                sizedBoxHeight = dynamicHeight(0.28);
              })
            });
  }

  void inputFocusChange() {
    if (inputFocusEmail || inputFocusPassword)
      setState(() {
        sizedBoxHeight = 0;
      });
    else
      setState(() {
        sizedBoxHeight = dynamicHeight(0.28);
      });
  }

  void inputFocusChangeEmail(bool hasFocus) {
    setState(() {
      inputFocusEmail = hasFocus;
    });
    inputFocusChange();
  }

  void inputFocusChangePassword(bool hasFocus) {
    setState(() {
      inputFocusPassword = hasFocus;
    });
    inputFocusChange();
  }

  Widget loginViewContainer(Widget child) {
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

  Widget signUpHereText() {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigateToPage(path: "/register");
      },
      child: TextSmall(
        text: "Sign Up here",
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
          text: "Didn’t have any account? ",
          color: white,
        ),
        signUpHereText()
      ],
    );
  }

  Widget loginForm() {
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
          secureText: true,
          icon: SvgInputIcon(
            svgName: "lock.svg",
          ),
          onFocusChange: (hasFocus) => inputFocusChangePassword(hasFocus),
        ),
        SizedBox(
          height: dynamicHeight(0.03),
        ),
        TextSmall(
          text: "Forgot Password",
          color: white,
          weight: FontWeight.w700,
        ),
        SizedBox(
          height: dynamicHeight(0.042),
        ),
        ButtonLarge(
            text: "Sign In",
            onTap: () =>
                NavigationService.instance.navigateToPage(path: "/home")),
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
      backgroundColor: backgroundColor,
      body: BaseView(
        scrollPhysics: ClampingScrollPhysics(),
        safeArea: false,
        onPageBuilder: (context) {
          return annotatedRegion(
            loginViewContainer(
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
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: sizedBoxHeight,
                  ),
                  loginForm(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
