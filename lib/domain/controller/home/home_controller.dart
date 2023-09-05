import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/data/datasource/home/userhome_data.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/domain/model/booking_model.dart';
import 'package:boat_booking/domain/model/yachetdetails_model.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class HomeController extends GetxController {
  getdata();
  goToCategoriesScreen(
      List categories, int selectedcategory, String categoryid);
  goToDetailsPage(YachetDetailsModel yachetDetailsModel);
  goToSafariPage(
      YachetDetailsModel yachetDetailsModel, BookingModel bookingModel);
}

class HomeControllerImp extends HomeController {
  SharedService sharedService = Get.find();
  final TextEditingController searchController = TextEditingController();
  String? itemsId;
  HomeData homeData = HomeData(Get.find());
  List yachet = [];

  late StatusRequest statusRequest;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

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
    var response = await homeData.getdata();
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
  goToCategoriesScreen(categories, selectedcategory, categoryid) {
    Get.toNamed(AppRoute.categoriesDetailsPage, arguments: {
      "categories": categories,
      "selectedcategory": selectedcategory,
      "categoryid": categoryid
    });
  }

  @override
  goToDetailsPage(
    yachetDetailsModel,
  ) {
    Get.toNamed(AppRoute.itemDetailsPage,
        arguments: {'detailsModel': yachetDetailsModel});
  }

  goToSafariPage(yachetDetailsModel, bookedModel) {
    Get.toNamed(AppRoute.safariDetailsPage, arguments: {
      'detailsModel': yachetDetailsModel,
      "bookedModel": bookedModel
    });
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
