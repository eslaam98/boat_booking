import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/items/mostitems_controller.dart';
import 'package:boat_booking/domain/model/yachetdetails_model.dart';
import 'package:boat_booking/screens/pages/items/homecard/cardsitem_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CardSItemScreen extends StatelessWidget {
  final List<Color> colors; // قائمة الألوان
  final Color? borderColor;

  const CardSItemScreen({Key? key, required this.colors, this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MostItemsControllerImp());
    return GetBuilder<MostItemsControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SizedBox(
                height: Get.height * 0.4,
                child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8),
                    itemCount: controller.yachet.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.goToDetailsPage(
                              YachetDetailsModel.fromJson(
                                  controller.yachet[index]));
                        },
                        child: CardSitemWidget(
                          yachetDetailsModel: YachetDetailsModel.fromJson(
                              controller.yachet[index]),
                          color: colors[index % colors.length],
                          borderColor: borderColor,
                        ),
                      );
                    }))));
  }
}
