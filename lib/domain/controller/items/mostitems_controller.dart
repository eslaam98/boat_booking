import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/data/datasource/home/userhome_data.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/domain/model/yachetdetails_model.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class MostItemsController extends GetxController {
  getdata();

  goToDetailsPage(
    YachetDetailsModel yachetDetailsModel,
  );
}

class MostItemsControllerImp extends MostItemsController {
  SharedService sharedService = Get.find();
  HomeData homeData = HomeData(Get.find());

  late StatusRequest statusRequest;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  List yachet = [];
  Future<void> onRefresh() async {
    getdata();
    await Future.delayed(const Duration(seconds: 3));
    refreshController.refreshCompleted();
  }

  @override
  getdata() async {
    yachet.clear();

    ///  hotels.clear();

    statusRequest = StatusRequest.loading;
    var response = await homeData.getMostItems();
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        yachet.addAll(response['data']);
        // hotels.addAll(response['hotelsview']['data']);
        // if (kDebugMode) {
        //   print(response['citys']['data']);
        //   print(response['hotelsview']['data']);
        // }
      } else {
        statusRequest = StatusRequest.failure;
        // CustomSnackWidget.appErrorSnack(
        //     Get.context!, "هناك خطا من فضلك حاول مرة اخري");
      }
    }
    update();
  }

  @override
  goToDetailsPage(
    yachetDetailsModel,
  ) {
    Get.toNamed(AppRoute.itemDetailsPage,
        arguments: {'detailsModel': yachetDetailsModel});
  }

  intialData() {
    getdata();
  }

  @override
  void onInit() {
    getdata();
    //intialData();
    super.onInit();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}
