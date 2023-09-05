import 'package:boat_booking/data/datasource/booking/bookingitem_data.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

abstract class BookingItemController extends GetxController {
  getItem();
}

class BookingItemControllerImp extends BookingItemController {
  BookingItemData bookingItemData = BookingItemData(Get.find());
  List booked = [];

  SharedService sharedService = Get.find();
  late StatusRequest statusRequest;

  @override
  getItem() async {
    booked.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bookingItemData
        .getItemBooked(sharedService.sharedPref.getString("user_id")!);
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        booked.addAll(response['data']);
      } else {}
    } else {}
    update();
  }

  intialData() {
    getItem();
  }

  @override
  void onInit() {
    getItem();
    super.onInit();
  }
}
