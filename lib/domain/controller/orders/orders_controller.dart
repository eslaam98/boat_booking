import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/data/datasource/categories/categories_id_data.dart';
import 'package:boat_booking/data/datasource/orders/orders_data.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/domain/model/order_model.dart';
import 'package:boat_booking/domain/model/yachetdetails_model.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class OrdersController extends GetxController {
  intialData();

  changeCat(int val);
  getItems(String categoriesId);
  ordersDetailsPage(
      OrderModel orderModel, YachetDetailsModel yachetDetailsModel);
}

class OrdersControllerImp extends OrdersController {
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest statusRequestTow = StatusRequest.none;

  List yachet = [];
  List<OrderModel> orderModel = [];
  List<YachetDetailsModel> yachetDetailsModel = [];

  String? categoryid;
  int? selectedcategory = 0;
  final List<String> ordersType = [
    "الحجوزات المنتظرة",
    "الحجوزات الجارية",
    "الحجوزات المكتملة",
    "الحجوزات المرفوضة",
  ];
  CategoriesIdData categoriesIdData = CategoriesIdData(Get.find());

  SharedService sharedService = Get.find();
  OrdersData ordersData = OrdersData(Get.find());
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  Future<void> onRefresh() async {
    getItems("0");
    await Future.delayed(const Duration(seconds: 3));
    refreshController.refreshCompleted();
  }

  @override
  changeCat(val) {
    selectedcategory = val;

    getItems(val.toString());
    update();
  }

  @override
  getItems(categoriesId) async {
    orderModel.clear();

    ///  hotels.clear();

    statusRequest = StatusRequest.loading;
    var response = await ordersData.getdata(
        sharedService.sharedPref.getString("user_id")!, categoriesId);
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        yachet.addAll(response['data']);
        List dataresponse = response['data'];

        orderModel.addAll(dataresponse.map((e) => OrderModel.fromJson(e)));
        yachetDetailsModel
            .addAll(dataresponse.map((e) => YachetDetailsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
        // CustomSnackWidget.appErrorSnack(
        //     Get.context!, "هناك خطا من فضلك حاول مرة اخري");
      }
    }
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    getItems("0");
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  ordersDetailsPage(orderModel, yachetDetailsModel) {
    Get.toNamed(AppRoute.bookingDetailsPage, arguments: {
      'orderModel': orderModel,
      'detailsModel': yachetDetailsModel,
    });
  }
}
