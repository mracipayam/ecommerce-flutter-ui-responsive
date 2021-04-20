import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/widgets/base_widget.dart';
import '../../../../core/components/appbars/appbar_search.dart';
import '../../../../core/components/rating/star_rating_filled.dart';
import '../../../../core/components/textfields/search_input.dart';
import '../../../../core/components/texts/text_medium.dart';
import '../../../../core/components/texts/text_small.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/constants/component/input_constants.dart';
import '../../../../core/init/theme/colors.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends BaseState<SearchView> {
  Widget searchInput() {
    return Container(
      alignment: Alignment.center,
      child: SearchInput(
        placeholder: "Search headphone",
      ),
    );
  }

  //LASTEST SEARCH BEGIN

  Widget lastestSearchHeader() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.0615)),
      child: TextMedium(
        text: "Lastest search",
        weight: FontWeight.bold,
      ),
    );
  }

  Widget lastestSearchHistoryItem(String historyText) {
    return Container(
      alignment: Alignment.center,
      width: dynamicWidth(InputConstants.LARGE_INPUT_WIDTH),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                ApplicationConstants.SVG_PATH + "clock.svg",
                width: dynamicWidth(0.066),
              ),
              SizedBox(
                width: dynamicWidth(0.0131),
              ),
              TextMedium(text: historyText),
            ],
          ),
          SvgPicture.asset(
            ApplicationConstants.SVG_PATH + "x.svg",
            width: dynamicWidth(0.066),
          ),
        ],
      ),
    );
  }

  Widget lastestSearchHistoryView() {
    List searchHistoryNameList = ["TMA2 Wireless", "Cable"];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.0615)),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              lastestSearchHistoryItem(searchHistoryNameList[index]),
              SizedBox(
                height: dynamicHeight(0.0263),
              )
            ],
          );
        },
        itemCount: searchHistoryNameList.length,
      ),
    );
  }

  Widget lastestSearchContainer() {
    return Column(
      children: [
        lastestSearchHeader(),
        SizedBox(
          height: dynamicHeight(0.0328),
        ),
        lastestSearchHistoryView()
      ],
    );
  }

  //LASTEST SEARCH END

  //POPULAR PRODUCTS BEGIN
  Widget popularProductHeader() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.0615)),
      child: TextMedium(
        text: "Popular products",
        weight: FontWeight.bold,
      ),
    );
  }

  Widget popularProductListItem() {
    return Row(
      children: [
        Row(
          children: [
            Container(
              width: dynamicWidth(0.21),
              height: dynamicWidth(0.21),
              decoration: BoxDecoration(
                  color: lightGrey,
                  borderRadius:
                      BorderRadius.all(Radius.circular(dynamicWidth(0.0256)))),
              child: Image.asset(
                ApplicationConstants.IMAGES_PATH + "tma-2.webp",
                width: dynamicWidth(0.141),
              ),
            ),
            SizedBox(
              width: dynamicWidth(0.0384),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextMedium(
                  text: "TMA-2 Comfort Wireless ",
                ),
                SizedBox(
                  height: dynamicHeight(0.005),
                ),
                TextMedium(
                  text: "USD 270",
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  height: dynamicHeight(0.012),
                ),
                Container(
                  width: dynamicWidth(0.602),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          StarFilledRating(),
                          TextSmall(text: "4.6"),
                          SizedBox(
                            width: dynamicWidth(0.0256),
                          ),
                          TextSmall(text: "86 Reviews"),
                        ],
                      ),
                      SvgPicture.asset(
                        ApplicationConstants.SVG_PATH + "more-vertical.svg",
                        width: dynamicWidth(0.0512),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget popularProductsListView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.0615)),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              popularProductListItem(),
              SizedBox(
                height: dynamicHeight(0.0263),
              )
            ],
          );
        },
        itemCount: 3,
      ),
    );
  }

  Widget popularProductsContainer() {
    return Column(
      children: [
        popularProductHeader(),
        SizedBox(
          height: dynamicHeight(0.0328),
        ),
        popularProductsListView()
      ],
    );
  }
  //POPULAR PRODUCTS END

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBarSearch(),
      body: BaseView(
        onPageBuilder: (context) {
          return Column(
            children: [
              SizedBox(height: dynamicHeight(0.0197)),
              searchInput(),
              SizedBox(
                height: dynamicHeight(0.0394),
              ),
              lastestSearchContainer(),
              SizedBox(
                height: dynamicHeight(0.025),
              ),
              popularProductsContainer()
            ],
          );
        },
      ),
    );
  }
}
