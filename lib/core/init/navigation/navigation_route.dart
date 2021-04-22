import 'package:ecommerceflutterapp/view/cart/shopping_cart.dart';
import 'package:ecommerceflutterapp/view/product_details/base/product_details.dart';
import 'package:ecommerceflutterapp/view/profile/profile.dart';

import '../../../view/authenticate/register/view/register_view.dart';
import '../../../view/home/explore_products/view/explore_products.dart';
import '../../../view/home/home/home_view.dart';
import '../../../view/home/search/view/search_view.dart';

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
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(HomeView());
      case NavigationConstants.SEARCH_VIEW:
        return normalNavigate(SearchView());
      case NavigationConstants.EXPLORE_PRODUCTS_VIEW:
        return normalNavigate(ExploreProductsView());
      case NavigationConstants.PRODUCT_DETAILS_VIEW:
        return normalNavigate(ProductDetails());
      case NavigationConstants.CART_VIEW:
        return normalNavigate(ShoppingCartView());
      case NavigationConstants.PROFILE_VIEW:
        return normalNavigate(ProfileView());
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
