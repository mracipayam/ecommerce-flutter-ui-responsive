import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_medium.dart';
import 'package:ecommerceflutterapp/core/init/theme/colors.dart';
import 'package:flutter/material.dart';

class ProductsHorizontalList extends StatefulWidget {
  @override
  _ProductsHorizontalListState createState() => _ProductsHorizontalListState();
}

class _ProductsHorizontalListState extends BaseState<ProductsHorizontalList> {
  int productsListSelectedIndex = 0;
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
        physics: BouncingScrollPhysics(),
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

  @override
  Widget build(BuildContext context) {
    return productHorizontalList();
  }
}
