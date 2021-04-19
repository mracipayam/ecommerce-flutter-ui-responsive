import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/base/widgets/base_widget.dart';
import 'package:ecommerceflutterapp/core/components/appbars/appbar_transparent.dart';
import 'package:ecommerceflutterapp/core/components/card/gray_card.dart';
import 'package:ecommerceflutterapp/core/components/svg/svg_input_icon.dart';
import 'package:ecommerceflutterapp/core/components/textfields/base_input.dart';
import 'package:ecommerceflutterapp/core/components/textfields/search_input.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_large.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_medium.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_s_large.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_small.dart';
import 'package:ecommerceflutterapp/core/constants/app/app_constants.dart';
import 'package:ecommerceflutterapp/core/init/navigation/navigation_service.dart';
import 'package:ecommerceflutterapp/core/init/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  bool inputFocusEmail = false;

  void inputFocusChangeEmail(bool hasFocus) {
    setState(() {
      inputFocusEmail = hasFocus;
    });
  }

  Widget productHorizontalListItem(String text, bool select) {
    return Container(
      decoration: select
          ? BoxDecoration(
              color: primary,
              borderRadius:
                  BorderRadius.all(Radius.circular(dynamicWidth(0.0769))))
          : BoxDecoration(),
      alignment: Alignment.center,
      width: dynamicWidth(0.274),
      child: TextMedium(
        text: text,
        color: select ? white : greyDark,
      ),
    );
  }

  Widget productHorizontalList() {
    return Container(
      width: dynamicWidth(1),
      height: dynamicWidth(0.1),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: dynamicWidth(0.0615),
          ),
          productHorizontalListItem("Headphone", true),
          SizedBox(
            width: dynamicWidth(0.0282),
          ),
          productHorizontalListItem("Headband", false),
          SizedBox(
            width: dynamicWidth(0.0282),
          ),
          productHorizontalListItem("Earpads", false),
          SizedBox(
            width: dynamicWidth(0.0282),
          ),
          productHorizontalListItem("Cable", false),
          SizedBox(
            width: dynamicWidth(0.0615),
          ),
        ],
      ),
    );
  }

  Widget headerText() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: dynamicWidth(0.062)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextMedium(
            text: "Hi, Andrea",
          ),
          SizedBox(
            height: dynamicHeight(0.0066),
          ),
          Container(
            width: dynamicWidth(0.85),
            child: TextLarge(
              weight: FontWeight.bold,
              text: "What are you looking for today?",
            ),
          )
        ],
      ),
    );
  }

  Widget productsContainer() {
    double cardRadius = 0.077;
    return GrayCard(
      child: Column(
        children: [productHorizontalList()],
      ),
    );
  }

  Widget upColumn() {
    return Column(
      children: [
        SizedBox(
          height: dynamicHeight(0.038),
        ),
        headerText(),
        SizedBox(
          height: dynamicHeight(0.038),
        ),
        SearchInput(
          placeholder: "Search headphone",
        ),
        SizedBox(
          height: dynamicHeight(0.0328),
        ),
      ],
    );
  }

  Widget bottomColumn() {
    return Column(
      children: [productsContainer()],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(dynamicSafeHeight(1).toString());
    print(dynamicHeight(1).toString());
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBarBase(),
      body: BaseView(
        scrollPhysics: ClampingScrollPhysics(),
        onPageBuilder: (context) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: dynamicSafeHeight(1)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [upColumn(), bottomColumn()],
            ),
          );
        },
      ),
    );
  }
}
