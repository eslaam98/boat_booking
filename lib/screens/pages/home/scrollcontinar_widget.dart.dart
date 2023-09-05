import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:boat_booking/domain/controller/orders/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomScrollContainerWidget extends GetView<OrdersControllerImp> {
  const CustomScrollContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 5),
          itemCount: controller.ordersType.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ProductList(
              i: index,
              //
            );
          },
        ));
  }
}

class ProductList extends GetView<OrdersControllerImp> {
  ///  final HotelsViewModel hotelsViewModel;
  final int? i;
  const ProductList({
    Key? key,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.changeCat(i!);
        },
        child: GetBuilder<OrdersControllerImp>(
          builder: (controller) => Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: controller.selectedcategory == i
                  ? AppColors.customappColors
                  : Colors.grey[50]!,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Text(controller.ordersType[i!],
                    style: TextStyle(
                        letterSpacing: 0.0,
                        fontFamily: AppFontStyle.fontStyle,
                        fontSize: 17,
                        color: controller.selectedcategory == i
                            ? AppColors.lightColor
                            : Colors.grey,
                        fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ));
  }
}
