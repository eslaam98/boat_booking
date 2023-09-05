import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/search/search_controller.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_button.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_button_tow.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_buttonshow.dart';
import 'package:boat_booking/screens/widgets/consts/widget/customformfieldthree.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchControllerImp());
    return GetBuilder<SearchControllerImp>(
      builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequestTow,
          widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const Icon(
                    Ionicons.remove,
                    size: 50,
                  ),
                  const CustomTextCuption(fontSize: 20, title: 'فلتر'),
                  const SizedBox(
                    height: 30,
                  ),
                  RangeSlider(
                    values: controller.currentRangeValues.value,
                    min: 0.0,
                    max: 1000.0,
                    divisions: 100,
                    labels: const RangeLabels("0\$", "1000\$"),
                    activeColor: Colors.teal,
                    inactiveColor: Colors.grey,
                    onChanged: (RangeValues values) {
                      controller.updateRangeValues(values);
                    },
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => CustomTextCuption(
                          title:
                              '${controller.currentRangeValues.value.start.round()} \$')),
                      Obx(() => CustomTextCuption(
                          title:
                              '${controller.currentRangeValues.value.end.round()} \$')),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomTextCuption(fontSize: 15, title: 'نوع الرحلة'),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 50,
                      height: 60.h,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: Colors.white, // لون خلفية الحاوية
                        border: Border.all(
                          color: AppColors.lightColor3,
                        ),
                        borderRadius:
                            BorderRadius.circular(20.0), // انحناء الحواف
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomTextCuption(
                              title: controller.selectedOption2.value,
                            ),
                            CustomDropdown(
                                options: controller.itemsOption,
                                selectedOption:
                                    controller.selectedOption2.value,
                                onChanged:
                                    controller.selectCategoryFromDropDown),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextCuption(fontSize: 15, title: 'المدينة'),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormFieldThree(
                    controller: controller.search!,
                    title: "اختر المدينة ",
                    suffixIcon: IconButton(
                        onPressed: () {
                          CustomBottomSheet.show(
                            context,
                            const Icon(Iconsax.arrow_left_24),
                            0.5,
                          );
                        },
                        icon: const Icon(Iconsax.arrow_left_24)),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                      height: 50.h,
                      child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 5),
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final stars = index + 1;
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[50]!,
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: controller.selectedStars.value ==
                                          '$stars'
                                      ? AppColors.customappColors
                                      : Colors
                                          .transparent, // لون الحد عند التحديد أو عدم التحديد
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  controller.saveSelectedStars('$stars');
                                },
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    Row(
                                      children: [
                                        ...List.generate(
                                            stars,
                                            (index) => Icon(
                                                  Ionicons.star,
                                                  color: Color(0xFFffb726),
                                                )),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text('($stars)',
                                            style: TextStyle(
                                                letterSpacing: 0.0,
                                                fontFamily:
                                                    AppFontStyle.fontStyle,
                                                fontSize: 18,
                                                color: controller.selectedStars
                                                            .value ==
                                                        stars
                                                    ? AppColors.customappColors
                                                    : AppColors.greyColor,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ),
                            );
                          })),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                          minWidth: Get.width * 0.4,
                          buttoncolor: AppColors.customappColors,
                          textcolor: Colors.white,
                          title: 'فلتر',
                          onPressed: () {
                            controller.getSearchWithFilterData();
                            controller.onSearchItems();
                          }),
                      CustomButtonTow(
                          minWidth: Get.width * 0.4,
                          sideColor: AppColors.customappColors,
                          title: 'مسح',
                          onPressed: () {
                            controller.checkSearch('');
                            controller.search!.clear();
                            Navigator.maybePop(context);
                          }),
                    ],
                  ),
                ],
              ))),
    );
  }
}
