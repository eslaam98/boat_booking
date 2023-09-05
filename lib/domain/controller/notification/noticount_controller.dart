// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:hotels_app/data/datasource/notification/notification_data.dart';
// import 'package:hotels_app/data/handling/handling_data.dart';
// import 'package:hotels_app/data/handling/status_request.dart';
// import 'package:hotels_app/domain/model/notification_model.dart';
// import 'package:hotels_app/utils/constants/shared_service.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

// class NotificationsCountController extends GetxController {
//   NotificationData notificationData = NotificationData(Get.find());

//   List data = [];

//   late StatusRequest statusRequest;
//   List<NotificationModel> notification = [];
//   SharedService sharedService = Get.find();
//   RefreshController refreshController =
//       RefreshController(initialRefresh: false);

//   Future<void> onRefresh() async {
//     getData();
//     await Future.delayed(Duration(seconds: 2));
//     refreshController.refreshCompleted();
//   }

//   getData() async {
//     notification.clear();
//     statusRequest = StatusRequest.loading;
//     var response = await notificationData
//         .getNotiCount(sharedService.sharedPref.getString("user_id")!);

//     if (kDebugMode) {
//       print("=============================== Controller $response ");
//     }
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       // Start backend
//       if (response['status'] == "success") {
//         data.addAll(response['data']);
//         List responsedata = response['data'];
//         notification
//             .addAll(responsedata.map((e) => NotificationModel.fromJson(e)));
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//       // End
//     }
//     update();
//   }

//   @override
//   void onInit() {
//     getData();
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     refreshController.dispose();
//     super.dispose();
//   }
// }
