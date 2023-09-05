import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/categories/categoriespage_controller.dart';
import 'package:boat_booking/domain/model/yachetdetails_model.dart';
import 'package:boat_booking/screens/pages/home/custom_card_uview.dart';
import 'package:boat_booking/screens/pages/items/category/customlistcatview.dart';
import 'package:boat_booking/screens/widgets/animation/custom_animation.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_appbar.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesDetailsPage extends StatelessWidget {
  const CategoriesDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDarkModeEnabled =
        sharedService.sharedPref.getBool('isDark') ?? false;
    Get.put(CategoriesPageControllerImp());
    return Scaffold(
        backgroundColor:
            isDarkModeEnabled ? AppColors.darkColor : AppColors.lightColor,
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              CustomAppBar(
                  title: Image.asset(
                    AppImageAsset.logoImage,
                    //height: 80.h,
                  ),
                  widgetBar: const Text('')),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: CustomAnimation(
                    millisecond: 2000, widget: CustomListCatView()),
              ),
              GetBuilder<CategoriesPageControllerImp>(
                  builder: (controller) => HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 5.0,
                                    childAspectRatio: (350 / 350),
                                    crossAxisCount: 1),
                            itemBuilder: (BuildContext context, index) {
                              return InkWell(
                                  onTap: () {
                                    controller.yachetDetailsModel(
                                        YachetDetailsModel.fromJson(
                                            controller.data[index]));
                                  },
                                  child: CustomCardUview(
                                      YachetDetailsModel.fromJson(
                                    controller.data[index],
                                  )));
                            }),
                      ))
            ])));
  }
}
