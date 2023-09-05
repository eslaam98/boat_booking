import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/categories/categories_controller.dart';
import 'package:boat_booking/domain/controller/items/mostitems_controller.dart';
import 'package:boat_booking/domain/controller/navigatorbar/customnbar_controller.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/pages/items/homecard/cardsitem_page.dart';
import 'package:boat_booking/screens/pages/items/category/cardcatview_widget.dart';
import 'package:boat_booking/screens/pages/items/homecard/cardview_screen.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_search_field.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_tow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final TextEditingController editingController = TextEditingController();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MostItemsControllerImp mostItemsControllerImp =
        Get.put(MostItemsControllerImp());
    CustomNBarControllerImp customNBarControllerImp =
        Get.put(CustomNBarControllerImp());

    Get.put(CategoriesControllerImp());
    return GetBuilder<CategoriesControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SmartRefresher(
                      header: const WaterDropHeader(
                        complete: Text(''),
                        waterDropColor: Colors.teal,
                      ),
                      controller: controller.refreshController,
                      onRefresh: () {
                        controller.onRefresh();
                      },
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: AppColors.customappColors,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )),
                            height: Get.height * 0.24,
                            child: Column(children: [
                              SizedBox(
                                height: 21.h,
                              ),
                              const CustomTextCuption(
                                fontFamily: 'Open Sans',
                                color: Colors.white,
                                title: "Boat Booking",
                                fontSize: 22,
                              ),
                              const CustomTextTow(
                                title: "اسرع واسهل وافضل",
                                fontSize: 12,
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Center(
                                  child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                clipBehavior: Clip.antiAlias,
                                height: 50,
                                minWidth: Get.width * 0.4,
                                color: AppColors.lightColor,
                                onPressed: () {},
                                child: Text("التفاصيل",
                                    style: TextStyle(
                                        letterSpacing: 0.5,
                                        fontFamily: AppFontStyle.fontStyle,
                                        color: AppColors.customappColorstow,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ))
                            ]),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          GetBuilder<CustomNBarControllerImp>(
                            builder: (controller) => CustomSearchField(
                              onTap: () {
                                controller.changePage(1);
                              },
                              controlleR: editingController,
                              onChanged: (fgg) {
                                controller.changePage(1);
                              },
                              pressedOnSearchIcon: () {
                                controller.changePage(1);
                              },
                              onPressedFilterIcon: () {
                                controller.changePage(1);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const CustomTextCuption(
                            title: "أنواع القوارب",
                            fontSize: 15,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const CardCatViewWidget(),
                          SizedBox(
                            height: 10.h,
                          ),
                          const CustomTextCuption(
                            title: "الاكثر طلباً",
                            fontSize: 15,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const CardSItemScreen(
                            colors: [
                              AppColors.lightGreenColor,
                              Color(0xFFfffcf4),
                              Color(0xFFf3f9fe),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const CustomTextCuption(
                            title: "القوارب",
                            fontSize: 15,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const CardviewScreen()
                        ],
                      ),
                    )))));
  }
}
