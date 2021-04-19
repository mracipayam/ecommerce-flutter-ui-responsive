import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/base/widgets/base_widget.dart';
import 'package:ecommerceflutterapp/core/components/appbars/appbar_transparent.dart';
import 'package:ecommerceflutterapp/core/components/buttons/button_text.dart';
import 'package:ecommerceflutterapp/core/components/card/card_fit_large.dart';
import 'package:ecommerceflutterapp/core/components/card/card_large.dart';
import 'package:ecommerceflutterapp/core/components/card/gray_card.dart';
import 'package:ecommerceflutterapp/core/components/svg/svg_input_icon.dart';
import 'package:ecommerceflutterapp/core/components/textfields/base_input.dart';
import 'package:ecommerceflutterapp/core/components/textfields/search_input.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_large.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_medium.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_s_large.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_small.dart';
import 'package:ecommerceflutterapp/core/constants/app/app_constants.dart';
import 'package:ecommerceflutterapp/core/constants/component/card_constants.dart';
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
  int productsListSelectedIndex = 0;
  int _productLargeCardHorizontalSnapListIndex = 0;
  int _productFitCardHorizontalSnapListIndex = 0;

  void inputFocusChangeEmail(bool hasFocus) {
    setState(() {
      inputFocusEmail = hasFocus;
    });
  }

  Widget productHorizontalListItem(String text, int index, bool select) {
    return GestureDetector(
      onTap: () {
        setState(() {
          productsListSelectedIndex = index;
        });
      },
      child: Container(
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
      ),
    );
  }

  bool productsSelected(int index) {
    return productsListSelectedIndex == index ? true : false;
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
          productHorizontalListItem("Headphone", 0, productsSelected(0)),
          SizedBox(
            width: dynamicWidth(0.0282),
          ),
          productHorizontalListItem("Headband", 1, productsSelected(1)),
          SizedBox(
            width: dynamicWidth(0.0282),
          ),
          productHorizontalListItem("Earpads", 2, productsSelected(2)),
          SizedBox(
            width: dynamicWidth(0.0282),
          ),
          productHorizontalListItem("Cable", 3, productsSelected(3)),
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

  //LARGE CARD BEGIN

  Widget productLargeCardHeaderText() {
    return Container(
        padding: EdgeInsets.only(
            left: dynamicWidth(0.0615), top: dynamicHeight(0.0263)),
        width: dynamicWidth(0.387),
        child: TextSLarge(
          text: "TMA-2 Modular Headphone",
          weight: FontWeight.bold,
        ));
  }

  Widget productLargeCardBottomText() {
    return Container(
        padding: EdgeInsets.only(
            left: dynamicWidth(0.0615), top: dynamicHeight(0.0263)),
        width: dynamicWidth(0.387),
        child: Row(
          children: [
            ButtonText(
              text: "Shop Now",
              iconName: "arrow-right.svg",
            ),
          ],
        ));
  }

  Widget productLargeCardImage() {
    return Image.asset(
      ApplicationConstants.IMAGES_PATH + "tma-2.webp",
      width: dynamicWidth(0.3),
    );
  }

  Widget productLargeCard() {
    return CardLarge(
        child: Row(
      children: [
        Column(
          children: [
            productLargeCardHeaderText(),
            productLargeCardBottomText()
          ],
        ),
        SizedBox(
          width: dynamicWidth(0.07),
        ),
        productLargeCardImage()
      ],
    ));
  }

  Widget productLargeCardHorizontalSnapList() {
    return Container(
      height: dynamicWidth(CardConstants.LARGE_CARD_HEIGHT),
      child: PageView.builder(
        itemCount: 10,
        controller: PageController(
            viewportFraction: CardConstants.LARGE_CARD_WIDTH - 0.06),
        onPageChanged: (int index) =>
            setState(() => _productLargeCardHorizontalSnapListIndex = index),
        itemBuilder: (_, i) {
          return Transform.scale(
              scale: i == _productLargeCardHorizontalSnapListIndex ? 1 : 0.9,
              child: productLargeCard());
        },
      ),
    );
  }

  // LARGE CARD END

  //FEATURED HEADER BEGIN
  Widget featuredHeaderContainer() {
    return Container(
      width: dynamicWidth(CardConstants.LARGE_CARD_WIDTH),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextMedium(text: "Featured Products"),
          TextSmall(
            text: "See all",
            color: greyDark,
          )
        ],
      ),
    );
  }
  //FEATURED HEADER END

  //BOTTOM PRODUCTS  BEGIN

  Widget productFitCardImage(String imageName) {
    return Container(
      height: dynamicHeight(0.2),
      child: Image.asset(
        ApplicationConstants.IMAGES_PATH + imageName,
        width: dynamicWidth(0.32),
      ),
    );
  }

  Widget productFitCardName(String productName) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.03)),
      child: TextMedium(text: productName),
    );
  }

  Widget productFitCardPrice(double price) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.03)),
      child: TextSmall(
        text: "USD " + price.toStringAsFixed(0),
        weight: FontWeight.bold,
      ),
    );
  }

  Widget productFitCard(
    String imageName,
    String cardName,
    double price,
  ) {
    return Row(
      children: [
        CardFitLarge(
            child: Column(
          children: [
            productFitCardImage(imageName),
            productFitCardName(cardName),
            productFitCardPrice(price),
          ],
        ))
      ],
    );
  }

  Widget productFitCardSnapListItem(Widget card1, Widget card2) {
    return Row(
      children: [
        SizedBox(
          width: dynamicWidth(0.0384),
        ),
        card1,
        SizedBox(
          width: dynamicWidth(0.0384),
        ),
        card2,
        SizedBox(
          width: dynamicWidth(0.0384),
        ),
      ],
    );
  }

  Widget productFitCardSnapList() {
    return Container(
      height: dynamicWidth(CardConstants.LARGE_CARD_FIT_HEIGHT),
      child: PageView.builder(
        itemCount: 10,
        controller: PageController(
            viewportFraction:
                CardConstants.LARGE_CARD_FIT_WIDTH * 2 + (0.0384 * 3)),
        onPageChanged: (int index) =>
            setState(() => _productFitCardHorizontalSnapListIndex = index),
        itemBuilder: (_, i) {
          return Transform.scale(
              scale: 1,
              child: productFitCardSnapListItem(
                productFitCard(
                  "tma-2.webp",
                  "TMA-2 HD Wireless",
                  350,
                ),
                productFitCard(
                  "cable.webp",
                  "C02 - Cable",
                  25,
                ),
              ));
        },
      ),
    );
  }
  //BOTTOM PRODUCTS END

  Widget productsContainer() {
    return GrayCard(
      child: Column(
        children: [
          SizedBox(
            height: dynamicHeight(0.042),
          ),
          productHorizontalList(),
          SizedBox(
            height: dynamicHeight(0.0263),
          ),
          productLargeCardHorizontalSnapList(),
          SizedBox(
            height: dynamicHeight(0.0263),
          ),
          featuredHeaderContainer(),
          SizedBox(
            height: dynamicHeight(0.0263),
          ),
          productFitCardSnapList()
        ],
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
      children: [
        productsContainer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
