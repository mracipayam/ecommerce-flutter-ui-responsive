import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/components/card/card_fit_large.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_medium.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_small.dart';
import 'package:ecommerceflutterapp/core/constants/app/app_constants.dart';
import 'package:ecommerceflutterapp/core/constants/component/card_constants.dart';
import 'package:ecommerceflutterapp/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

class ProductFitHorizontalList extends StatefulWidget {
  @override
  _ProductFitHorizontalListState createState() =>
      _ProductFitHorizontalListState();
}

class _ProductFitHorizontalListState
    extends BaseState<ProductFitHorizontalList> {
  void routeAtProductDetailsView() {
    NavigationService.instance.navigateToPage(path: "/product-details");
  }

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
        GestureDetector(
          onTap: routeAtProductDetailsView,
          child: CardFitLarge(
              child: Column(
            children: [
              productFitCardImage(imageName),
              productFitCardName(cardName),
              productFitCardPrice(price),
            ],
          )),
        )
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
        physics: BouncingScrollPhysics(),
        controller: PageController(
            viewportFraction:
                CardConstants.LARGE_CARD_FIT_WIDTH * 2 + (0.0384 * 3)),
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

  @override
  Widget build(BuildContext context) {
    return productFitCardSnapList();
  }
}
