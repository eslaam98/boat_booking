import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/booking/bookeditem_controller.dart';
import 'package:boat_booking/domain/controller/home/home_controller.dart';
import 'package:boat_booking/domain/model/booking_model.dart';
import 'package:boat_booking/domain/model/yachetdetails_model.dart';
import 'package:boat_booking/screens/pages/items/homecard/custom_card_uview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SafariScreen extends StatelessWidget {
  const SafariScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    BookingItemControllerImp bookingItemControllerImp =
        Get.put(BookingItemControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.yachet.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 5.0,
                    childAspectRatio: (350 / 330),
                    crossAxisCount: 1),
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                      onTap: () {
                        controller.goToSafariPage(
                            YachetDetailsModel.fromJson(
                              controller.yachet.reversed.toList()[index],
                            ),
                            BookingModel.fromJson(bookingItemControllerImp
                                .booked.reversed
                                .toList()[index]));
                      },
                      child: CardviewWidget(YachetDetailsModel.fromJson(
                        controller.yachet.reversed.toList()[index],
                      )));
                })));
  }
}
