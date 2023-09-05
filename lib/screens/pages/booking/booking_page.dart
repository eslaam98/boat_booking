import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/orders/orders_controller.dart';
import 'package:boat_booking/screens/pages/home/scrollcontinar_widget.dart.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/items/def_cardtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersControllerImp());
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          SizedBox(
            height: 20.h,
          ),
          const CustomTextCuption(title: "الحجوزات", fontSize: 18),
          Column(children: [
            const CustomScrollContainerWidget(),
            SizedBox(
              height: 20.h,
            ),
            GetBuilder<OrdersControllerImp>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                        itemCount: controller.orderModel.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return DefCardTitle(
                            onTap: () {
                              controller.ordersDetailsPage(
                                  controller.orderModel[index],
                                  controller.yachetDetailsModel[index]);
                            },
                            orderId: controller.orderModel[index].orderId!,
                            itemName: controller.orderModel[index].itemName!,
                            orderDate:
                                controller.orderModel[index].orderTimecreate!,
                            orderPrice:
                                controller.orderModel[index].orderPrice!,
                            itemImage: controller.orderModel[index].itemImage!,
                          );
                        })))
          ])
        ]));
  }
}
