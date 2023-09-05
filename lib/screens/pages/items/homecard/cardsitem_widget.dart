import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/domain/controller/items/mostitems_controller.dart';
import 'package:boat_booking/domain/model/yachetdetails_model.dart';
import 'package:boat_booking/screens/pages/items/homecard/custom_price_widget.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class CardSitemWidget extends GetView<MostItemsControllerImp> {
  final YachetDetailsModel yachetDetailsModel;
  final Color? color;
  final Color? borderColor;

  const CardSitemWidget(
      {Key? key,
      required this.yachetDetailsModel,
      this.borderColor,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isDarkModeEnabled =
    //     sharedService.sharedPref.getBool('isDark') ?? false;
    return Padding(
      padding: const EdgeInsets.all(8),

      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent),
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        height: Get.height * 0.32,
        width: Get.width * 0.46,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Ionicons.star,
                        size: 25,
                        color: Color(0xFFffb726),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "(${yachetDetailsModel.itemsStars})",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl:
                          "${ServerLink.linkImageUser}/${yachetDetailsModel.itemImage}",
                      height: Get.height * 0.15,
                      width: Get.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextCuption(
                          title: "${yachetDetailsModel.itemName}",
                          fontSize: 13,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomPriceWidget(
                              price: "${yachetDetailsModel.itemPrice}",
                            ),
                            const Icon(Ionicons.arrow_back,
                                color: AppColors.customappColors),
                          ],
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text('لكل مجموعة',
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ]),
                ])),
      ),
      //  )),
      //)
    );
  }
}
