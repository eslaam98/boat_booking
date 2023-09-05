import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/search/search_controller.dart';
import 'package:boat_booking/screens/pages/items/category/cardcatview_widget.dart';
import 'package:boat_booking/screens/pages/search/filter_screen.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_search_field.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_buttonshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../items/homecard/custom_card_uview.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchControllerImp());
    return GetBuilder<SearchControllerImp>(
        builder: (searchControllerImp) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              SizedBox(
                height: 20.h,
              ),
              GetBuilder<SearchControllerImp>(
                builder: (searchControllerImp) => CustomSearchField(
                    controlleR: searchControllerImp.search!,
                    onChanged: (val) {
                      searchControllerImp.checkSearch(val);
                    },
                    pressedOnSearchIcon: () {
                      searchControllerImp.onSearchItems();
                    },
                    onPressedFilterIcon: () {
                      CustomBottomSheet.show(
                        context,
                        const FilterScreen(),
                        0.9,
                      );
                    }),
              ),
              SizedBox(
                height: 20.h,
              ),
              const CustomTextCuption(fontSize: 16, title: "نتائج البحث"),
              GetBuilder<SearchControllerImp>(
                  builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequestTow,
                      widget: !searchControllerImp.isSearch
                          ? const CardCatViewWidget()
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.yachetModel.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 5.0,
                                      childAspectRatio: (350 / 330),
                                      crossAxisCount: 1),
                              itemBuilder: (BuildContext context, index) {
                                return InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoute.itemDetailsPage,
                                          arguments: {
                                            "detailsModel":
                                                controller.yachetModel[index]
                                          });
                                    },
                                    child: CardviewWidget(
                                        controller.yachetModel[index]));
                              })))
            ])));
  }
}
