import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/components/avatars/avatar_small.dart';
import 'package:ecommerceflutterapp/core/components/buttons/button_large.dart';
import 'package:ecommerceflutterapp/core/components/card/card_comment_photo.dart';
import 'package:ecommerceflutterapp/core/components/card/card_product_detail_image.dart';
import 'package:ecommerceflutterapp/core/components/lists/products_fit_horizontal_list.dart';
import 'package:ecommerceflutterapp/core/components/rating/star_rating_five.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_medium.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_small.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_x_small.dart';
import 'package:ecommerceflutterapp/core/constants/app/app_constants.dart';
import 'package:ecommerceflutterapp/core/constants/component/card_constants.dart';
import 'package:ecommerceflutterapp/core/init/theme/colors.dart';
import 'package:flutter/material.dart';

class ProductOverviewView extends StatefulWidget {
  @override
  _ProductOverviewViewState createState() => _ProductOverviewViewState();
}

class _ProductOverviewViewState extends BaseState<ProductOverviewView> {
  //PRODUCT IMAGES BEGIN

  List<String> imageNames = [
    "product_details_image1.png",
    "product_details_image2.png",
    "product_details_image1.png",
    "product_details_image2.png",
  ];

  Widget productImagesHorizontalListItem(String imageName) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: dynamicWidth(0.0256)),
      child: CardProductDetailImage(
        child: Center(
            child: Image.asset(
          ApplicationConstants.IMAGES_PATH + imageName,
          width: dynamicWidth(CardConstants.PRODUCT_DETAIL_IMAGE_CARD_WIDTH),
          height: dynamicHeight(CardConstants.PRODUCT_DETAIL_IMAGE_CARD_HEIGHT),
        )),
      ),
    );
  }

  Widget productImagesHorizontalList() {
    return Container(
      height: dynamicHeight(CardConstants.PRODUCT_DETAIL_IMAGE_CARD_HEIGHT),
      child: PageView.builder(
        itemCount: imageNames.length,
        physics: BouncingScrollPhysics(),
        controller: PageController(viewportFraction: 0.76),
        itemBuilder: (_, i) {
          return productImagesHorizontalListItem(imageNames[i]);
        },
      ),
    );
  }

  //PRODUCT IMAGES END

  //REVIEWS BEGIN

  Widget reviewImage(List<String> photos) {
    return Container(
      width: dynamicWidth(0.755),
      child: Wrap(
        runSpacing: dynamicWidth(0.0384),
        children: [
          for (int index = 0; index <= photos.length - 1; index++)
            Padding(
              padding: EdgeInsets.only(right: dynamicWidth(0.0384)),
              child: CardCommentPhoto(
                child: Center(
                  child: Image.asset(
                    ApplicationConstants.IMAGES_PATH + photos[index],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget reviewContainer(
      String name, int rate, String message, List<String> photos) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.0512)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: dynamicHeight(0.0328),
          ),
          reviewInfo(name, rate),
          SizedBox(
            height: dynamicHeight(0.01),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: reviewText(message),
          ),
          photos.length > 0
              ? Container(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      SizedBox(
                        height: dynamicHeight(0.0197),
                      ),
                      reviewImage(photos)
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  Widget reviewText(String message) {
    return Container(
      width: dynamicWidth(0.755),
      child: TextSmall(text: message),
    );
  }

  Widget reviewInfo(String name, int rate) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AvatarSmall(),
              SizedBox(
                width: dynamicWidth(0.033),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [TextMedium(text: name), StarRatingFive(rate: rate)],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: dynamicHeight(0.006)),
            child: TextXSmall(
              text: "1 Month Ago",
              color: greyDark,
            ),
          )
        ],
      ),
    );
  }

  Widget seeAllButton() {
    return Container(
      child: TextMedium(
        color: greyDark,
        text: "See All Reviews",
      ),
    );
  }

  Widget reviewsColumn() {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(left: dynamicWidth(0.0512)),
            alignment: Alignment.centerLeft,
            child: TextMedium(text: "Review (102)")),
        reviewContainer(
            "Madelina",
            5,
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            []),
        reviewContainer(
            "Irfan",
            5,
            "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
            [
              "tma-2.webp",
              "tma-2.webp",
              "tma-2.webp",
            ]),
        reviewContainer("Ravi Putra", 5,
            "Excepteur sint occaecat cupidatat non proident", []),
        SizedBox(
          height: dynamicHeight(0.0526),
        ),
        seeAllButton()
      ],
    );
  }

  //REVIEWS END

  //ANOTHER PRODUCT BEGIN

  Widget anotherProductHeader() {
    return Container(
      width: dynamicWidth(0.92),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        TextMedium(
          text: "Another Product",
        ),
        TextSmall(
          text: "See All",
        )
      ]),
    );
  }

  Widget anotherProductContainer() {
    return Container(
      color: lightGrey,
      width: dynamicWidth(1),
      padding: EdgeInsets.symmetric(vertical: dynamicHeight(0.0368)),
      child: Column(
        children: [
          anotherProductHeader(),
          SizedBox(
            height: dynamicHeight(0.0263),
          ),
          ProductFitHorizontalList()
        ],
      ),
    );
  }

  //ANOTHER PRODUCT END

  //ADD TO CART BUTTON BEGIN

  Widget addToCartButton() {
    return ButtonLarge(text: "Add To Cart");
  }

  //ADD TO CART BUTTON END

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: dynamicHeight(0.0381),
          ),
          productImagesHorizontalList(),
          SizedBox(
            height: dynamicHeight(0.0526),
          ),
          reviewsColumn(),
          SizedBox(
            height: dynamicHeight(0.0526),
          ),
          anotherProductContainer(),
          SizedBox(
            height: dynamicHeight(0.0394),
          ),
          addToCartButton(),
          SizedBox(
            height: dynamicHeight(0.0526),
          ),
        ],
      ),
    );
  }
}
