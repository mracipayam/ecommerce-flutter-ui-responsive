import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/components/card/card_product_detail_image.dart';
import 'package:ecommerceflutterapp/core/constants/app/app_constants.dart';
import 'package:ecommerceflutterapp/core/constants/component/card_constants.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: dynamicHeight(0.0381),
        ),
        productImagesHorizontalList()
      ],
    ));
  }
}
