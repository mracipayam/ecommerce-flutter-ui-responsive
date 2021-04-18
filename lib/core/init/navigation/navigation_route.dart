import 'package:ecommerceflutterapp/view/authenticate/register/view/register_view.dart';

import '../../components/notfound/not_found.dart';
import '../../constants/navigation/navigation_constants.dart';
import '../../../view/authenticate/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(LoginView());
      case NavigationConstants.REGISTER_VIEW:
        return normalNavigate(RegisterView());
      default:
        return MaterialPageRoute(
          builder: (context) => NotFound(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}