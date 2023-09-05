import 'package:boat_booking/data/datasource/notification/notification_data.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/domain/model/notification_model.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:get/get.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class NotificationsController extends GetxController {
  getNotification();
}

class NotificationsControllerImp extends NotificationsController {
  NotificationData notificationData = NotificationData(Get.find());
  late StatusRequest statusRequest;

  List data = [];

  List<NotificationModel> notification = [];
  SharedService sharedService = Get.find();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  Future<void> onRefresh() async {
    getNotification();
    await Future.delayed(const Duration(seconds: 2));
    refreshController.refreshCompleted();
  }

  @override
  getNotification() async {
    notification.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData
        .getData(sharedService.sharedPref.getString("user_id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        // print(response['data']);
        data.addAll(response['data']);
        List responsedata = response['data'];
        notification
            .addAll(responsedata.map((e) => NotificationModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
    // End
  }

  // readNotification(id) async {
  //   statusRequest = StatusRequest.loading;
  //   var response = await notificationData.makeNotificationAsRead(id);

  //   if (kDebugMode) {
  //     print("=============================== Controller $response ");
  //   }
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     // Start backend
  //     if (response['status'] == "success") {
  //       if (kDebugMode) {
  //         print('done');
  //       }
  //     } else {}
  //     // End
  //   }
  //   update();
  // }

  @override
  void onInit() {
    getNotification();
    super.onInit();
  }

  // goToNotifDetails(
  //   detailsModel,
  // ) {
  //   Get.toNamed(AppRoute.notificationDetailsPage,
  //       arguments: {'detailsModel': detailsModel});
  // }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}
