import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/screens/pages/items/homecard/custom_price_widget.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';

class DefCardTitle extends StatelessWidget {
  final String orderId;
  final String itemName;
  final String orderDate;
  final String orderPrice;
  final String itemImage;
  final void Function() onTap;

  const DefCardTitle(
      {super.key,
      required this.orderId,
      required this.itemName,
      required this.orderDate,
      required this.orderPrice,
      required this.itemImage,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextCuption(title: "رقم الطلب : ${orderId}", fontSize: 15),
              SizedBox(
                height: 10.h,
              ),
              CustomTextCuption(
                  color: AppColors.customappColorstow,
                  title: '${itemName}',
                  fontSize: 14),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextCuption(
                      color: Colors.grey,
                      title: Jiffy(
                        orderDate,
                      ).yMMMMEEEEdjm,
                      fontSize: 11),
                  CustomPriceWidget(price: '${orderPrice}')
                ],
              )
            ],
          ),
          leading: Container(
            alignment: Alignment.center,
            height: 90.h,
            width: 60.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: CachedNetworkImage(
                  imageUrl: "${ServerLink.linkImageUser}/${itemImage}",
                  height: 90,
                  width: 70,
                  fit: BoxFit.fill),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        const Divider(
          thickness: 2,
          indent: 60,
        )
      ],
    );
  }
}
