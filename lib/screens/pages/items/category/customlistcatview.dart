import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/domain/controller/categories/categoriespage_controller.dart';
import 'package:boat_booking/domain/model/categories_model.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/utils/constants/transate_name_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListCatView extends GetView<CategoriesPageControllerImp> {
  const CustomListCatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ProductList(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]),
            );
          },
        ));
  }
}

class ProductList extends GetView<CategoriesPageControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const ProductList({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.changeCat(i!, categoriesModel.categoryId!);
        },
        child: GetBuilder<CategoriesPageControllerImp>(
          builder: (controller) => Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: controller.selectedcategory == i
                  ? AppColors.customappColors
                  : Colors.grey[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                const SizedBox(width: 5),
                CustomTextCuption(
                  title: translateNameArEnDatabase(
                      categoriesModel.categoryNameAr,
                      categoriesModel.categoryNameEn),
                  color: controller.selectedcategory == i
                      ? AppColors.lightColor
                      : AppColors.greyColor,
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ));
  }
}
