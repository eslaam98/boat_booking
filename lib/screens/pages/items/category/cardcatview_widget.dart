import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/domain/controller/categories/categories_controller.dart';
import 'package:boat_booking/domain/model/categories_model.dart';
import 'package:boat_booking/utils/constants/transate_name_database.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class CardCatViewWidget extends GetView<CategoriesControllerImp> {
  const CardCatViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Get.height * 0.15,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Categories(
                i: index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]));
          },
        ));
  }
}

class Categories extends GetView<CategoriesControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToCategoriesScreen(
              controller.categories, i!, categoriesModel.categoryId!);
        },
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                shape: BoxShape.rectangle,
                border: Border.all(color: AppColors.lightColor3),
              ),
              child: Hero(
                tag:
                    "${ServerLink.linkYachetsImages}/${categoriesModel.categoryImage}",
                child: CachedNetworkImage(
                  imageUrl:
                      "${ServerLink.linkYachetsImages}/${categoriesModel.categoryImage}",
                  fit: BoxFit.none,
                  width: 25,
                  height: 25,
                ),
              )),
          SizedBox(
            height: 10.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                translateNameArEnDatabase("${categoriesModel.categoryNameAr}",
                    '${categoriesModel.categoryNameEn}'),
                style: TextStyle(
                  fontFamily: AppFontStyle.fontStyle,
                  fontSize: 15,
                  color: AppColors.darkColor,
                ),
              ),
            ],
          )
        ]));
  }
}
