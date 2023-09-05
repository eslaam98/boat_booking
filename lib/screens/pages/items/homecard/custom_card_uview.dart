import 'package:boat_booking/domain/model/yachetdetails_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/domain/controller/home/home_controller.dart';
import 'package:boat_booking/screens/pages/items/homecard/custom_price_widget.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_tow.dart';

class CardviewWidget extends GetView<HomeControllerImp> {
  final YachetDetailsModel yachetDetailsModel;
  const CardviewWidget(
    this.yachetDetailsModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isDarkModeEnabled =
    //     sharedService.sharedPref.getBool('isDark') ?? false;
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 220.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: <Widget>[
          FractionallySizedBox(
            heightFactor: 0.65.h,
            widthFactor: 1.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Hero(
                tag:
                    '${ServerLink.linkImageUser}/${yachetDetailsModel.itemImage}',
                child: CachedNetworkImage(
                    imageUrl:
                        '${ServerLink.linkImageUser}/${yachetDetailsModel.itemImage}',
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Positioned(
              top: 20.0,
              left: 15.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Ionicons.star,
                    size: 25,
                    color: Color(0xFFffb726),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomTextTow(
                      title: "(${yachetDetailsModel.itemsStars})",
                      fontSize: 15),
                ],
              )),
          Positioned(
            right: 8.h,
            bottom: 9.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomTextCuption(
                    fontSize: 17, title: "${yachetDetailsModel.itemName}"),
                const SizedBox(
                  height: 2.0,
                ),
                Row(children: [
                  CustomPriceWidget(price: "${yachetDetailsModel.itemPrice}"),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text('لكل مجموعة',
                      style: TextStyle(fontSize: 15, color: Colors.grey)),
                  const SizedBox(
                    width: 10.0,
                  ),
                ])
              ],
            ),
          ),
          Positioned(
              bottom: 12.0,
              left: 20.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    clipBehavior: Clip.antiAlias,
                    height: 40,
                    minWidth: Get.width * 0.3,
                    color: AppColors.customappColors,
                    onPressed: () {},
                    child: Text('احجز الان',
                        style: TextStyle(
                            letterSpacing: 0.5,
                            fontFamily: AppFontStyle.fontStyle,
                            color: AppColors.lightColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
