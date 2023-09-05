import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/notification/notifications_controller%20.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/items/def_noticard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationsControllerImp notificationsControllerImp =
        Get.put(NotificationsControllerImp());
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: SmartRefresher(
            header: const WaterDropHeader(
              complete: Text(''),
              waterDropColor: Colors.teal,
            ),
            controller: notificationsControllerImp.refreshController,
            onRefresh: () {
              notificationsControllerImp.onRefresh();
            },
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              SizedBox(
                height: 20.h,
              ),
              const CustomTextCuption(title: "اخر الاشـعارات", fontSize: 18),
              Column(children: [
                SizedBox(
                  height: 10.h,
                ),
                GetBuilder<NotificationsControllerImp>(
                    builder: (controller) => HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: ListView.builder(
                            itemCount: controller.notification.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return DefNotiCard(
                                  notificationDesc: controller
                                      .notification[index].notificationDesc!,
                                  notificationImage: controller
                                      .notification[index].notificationImage!,
                                  notificationTitle: controller
                                      .notification[index].notificationTitle!,
                                  notificationTimecreate: controller
                                      .notification[index]
                                      .notificationTimecreate!);
                            })))
              ])
            ])));
  }
}
