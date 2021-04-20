import 'package:ecommerceflutterapp/core/base/state/base_state.dart';
import 'package:ecommerceflutterapp/core/components/appbars/appbar_back_cart.dart';
import 'package:ecommerceflutterapp/core/components/buttons/button_filter.dart';
import 'package:ecommerceflutterapp/core/components/buttons/button_large.dart';
import 'package:ecommerceflutterapp/core/components/buttons/chips_button_small.dart';
import 'package:ecommerceflutterapp/core/components/focus/refresh_focus.dart';
import 'package:ecommerceflutterapp/core/components/lists/products_horizontal_list.dart';
import 'package:ecommerceflutterapp/core/components/textfields/double_input.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_large.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_medium.dart';
import 'package:ecommerceflutterapp/core/components/texts/text_small.dart';
import 'package:ecommerceflutterapp/core/constants/app/app_constants.dart';
import 'package:ecommerceflutterapp/core/constants/component/button_constants.dart';
import 'package:ecommerceflutterapp/core/init/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreProductsView extends StatefulWidget {
  @override
  _ExploreProductsViewState createState() => _ExploreProductsViewState();
}

class _ExploreProductsViewState extends BaseState<ExploreProductsView> {
  List<Widget> listWidgets = [];
  int selectedFilterChipsIndex = 0;
  //HEADER TEXTS BEGIN
  Widget productTypeText() {
    return TextMedium(text: "Headphone");
  }

  Widget productModelText() {
    return TextLarge(
      text: "TMA Wireless",
      weight: FontWeight.bold,
    );
  }

  Widget headerTextContainer() {
    return Container(
      padding: EdgeInsets.only(left: dynamicWidth(0.0641)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [productTypeText(), productModelText()],
      ),
    );
  }
  //HEADER TEXTS END

  //HORIZONTAL SCROLL BEGIN
  Widget startEndMargin() {
    return SizedBox(
      width: dynamicWidth(0.0615),
    );
  }

  Widget betweenMargin() {
    return SizedBox(
      width: dynamicWidth(0.0538),
    );
  }

  void listWidgetsAdd() {
    listWidgets = [
      startEndMargin(),
      ButtonFilter(
        onTap: openBottomFilterModal,
      ),
      betweenMargin(),
      Container(
          alignment: Alignment.center, child: TextMedium(text: "Popularity")),
      betweenMargin(),
      Container(alignment: Alignment.center, child: TextMedium(text: "Newest")),
      betweenMargin(),
      Container(
          alignment: Alignment.center,
          child: TextMedium(text: "Most Expensive")),
      startEndMargin()
    ];
  }

  Widget listHorizontal() {
    listWidgetsAdd();
    return Container(
      height: dynamicHeight(ButtonConstants.FILTER_BUTTON_HEIGHT),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return listWidgets[index];
        },
        itemCount: listWidgets.length,
      ),
    );
  }

  //HORIZONTAL SCROLL END
  //
  //FILTER MODAL BEGIN

  Widget filterModalHeader() {
    return Container(
        width: dynamicWidth(0.838),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextLarge(
              text: "Filter",
              weight: FontWeight.bold,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                ApplicationConstants.SVG_PATH + "x.svg",
                width: dynamicWidth(0.0715),
              ),
            )
          ],
        ));
  }

  Widget filterModalSectionHeader(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: dynamicWidth(0.0615)),
      child: TextMedium(
        text: text,
      ),
    );
  }

  List<String> chipsButtonsList = [
    "Popularity",
    "Newest",
    "Oldest",
    "High Price",
    "Low Price",
    "Review"
  ];

  Widget filterModalSortChipsItem(String buttonText, int index) {
    return Padding(
      padding: EdgeInsets.only(
          right: dynamicWidth(0.0307), bottom: dynamicWidth(0.0307)),
      child: ChipsSmallButton(
          selected: selectedFilterChipsIndex == index ? true : false,
          buttonText: buttonText),
    );
  }

  Widget filterModalSortChips() {
    return Container(
      alignment: Alignment.centerLeft,
      width: dynamicWidth(0.838),
      child: StatefulBuilder(
        builder: (context, _setState) {
          return Wrap(
            children: [
              for (int index = 0; index <= chipsButtonsList.length - 1; index++)
                GestureDetector(
                    onTap: () {
                      _setState(() {
                        selectedFilterChipsIndex = index;
                      });
                    },
                    child: filterModalSortChipsItem(
                        chipsButtonsList[index], index))
            ],
          );
        },
      ),
    );
  }

  Widget filterModalContainer() {
    return Container(
      height: dynamicHeight(0.72),
      child: Column(
        children: [
          SizedBox(
            height: dynamicHeight(0.0315),
          ),
          filterModalHeader(),
          SizedBox(
            height: dynamicHeight(0.0460),
          ),
          filterModalSectionHeader("Category"),
          SizedBox(
            height: dynamicHeight(0.0131),
          ),
          ProductsHorizontalList(),
          SizedBox(
            height: dynamicHeight(0.0460),
          ),
          filterModalSectionHeader("Sort by"),
          SizedBox(
            height: dynamicHeight(0.0131),
          ),
          filterModalSortChips(),
          SizedBox(
            height: dynamicHeight(0.0460),
          ),
          filterModalSectionHeader("Price Range"),
          SizedBox(
            height: dynamicHeight(0.0131),
          ),
          DoubleInput(
            placeholder1: "Min Price",
            keyboardType1: TextInputType.number,
            placeholder2: "Max Price",
            keyboardType2: TextInputType.number,
          ),
          SizedBox(
            height: dynamicHeight(0.0460),
          ),
          ButtonLarge(
              onTap: () {
                Navigator.pop(context);
              },
              text: "Apply Filter")
        ],
      ),
    );
  }

  Future<void> openBottomFilterModal() {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(dynamicWidth(0.0769)),
            topRight: Radius.circular(dynamicWidth(0.0769))),
      ),
      builder: (BuildContext context) {
        return filterModalContainer();
      },
    );
  }

  //FILTER MODAL END

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBarBackCart(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerTextContainer(),
          SizedBox(
            height: dynamicHeight(0.0263),
          ),
          listHorizontal()
        ],
      ),
    );
  }
}
