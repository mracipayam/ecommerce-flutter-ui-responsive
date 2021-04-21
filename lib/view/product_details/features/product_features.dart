import 'package:ecommerceflutterapp/core/components/buttons/button_large.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_medium.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_small.dart';
import 'package:ecommerceflutterapp/core/constants/app/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../core/base/state/base_state.dart';

class ProductFeaturesView extends StatefulWidget {
  @override
  _ProductFeaturesViewState createState() => _ProductFeaturesViewState();
}

class _ProductFeaturesViewState extends BaseState<ProductFeaturesView> {
  //FEATURES DETAILS BEGIN

  Widget productDetailsHeaderText() {
    return Container(
      alignment: Alignment.centerLeft,
      child: TextMedium(
        text: "Highly Detailed Audio",
        weight: FontWeight.bold,
      ),
    );
  }

  Widget productDetailsMoreText() {
    return TextSmall(
      text:
          "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.\n\n The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. ",
    );
  }

  Widget productDetailsContainer() {
    return Column(
      children: [
        productDetailsHeaderText(),
        SizedBox(
          height: dynamicHeight(0.0171),
        ),
        productDetailsMoreText()
      ],
    );
  }

  //FEATURES DETAILS  END

  //FEATURES PHOTOS DETALS BEGIN

  Widget photoDetailsListItem(
      String imageName, String productName, String productDetails) {
    return Row(
      children: [
        Container(
          width: dynamicWidth(0.256),
          height: dynamicWidth(0.256),
          child: Image.asset(ApplicationConstants.IMAGES_PATH + imageName),
        ),
        SizedBox(
          width: dynamicWidth(0.0359),
        ),
        Container(
          width: dynamicWidth(0.54),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: TextMedium(
                  text: productName,
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: dynamicHeight(0.01),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: TextSmall(
                  text: productDetails,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget photoDetailsListContainer() {
    return Column(
      children: [
        SizedBox(
          height: dynamicHeight(0.0315),
        ),
        photoDetailsListItem(
            "product_details_image3.png",
            "APTX HD WIRELESS AUDIO",
            "The Aptx® HD codec transmits 24-bit hi-res audio, equal to or better than CD quality."),
        SizedBox(
          height: dynamicHeight(0.0315),
        ),
        photoDetailsListItem(
            "product_details_image4.png",
            "ULTRA SOFT WITH ALCANTARA",
            "Alcantara® is a highly innovative material offering an unrivalled combination of"),
        SizedBox(
          height: dynamicHeight(0.0315),
        ),
      ],
    );
  }

  //FEATURES PHOTOS DETALS END

  //ADD TO CART BUTTON BEGIN

  Widget addToCartButton() {
    return ButtonLarge(text: "Add To Cart");
  }

  //ADD TO CART BUTTON END

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.08)),
        child: Column(
          children: [
            SizedBox(
              height: dynamicHeight(0.0381),
            ),
            productDetailsContainer(),
            photoDetailsListContainer(),
            addToCartButton(),
            SizedBox(
              height: dynamicHeight(0.02),
            ),
          ],
        ),
      ),
    );
  }
}
