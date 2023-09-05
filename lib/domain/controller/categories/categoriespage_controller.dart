import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/data/datasource/categories/categories_id_data.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/domain/model/yachetdetails_model.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

abstract class CategoriesPageController extends GetxController {
  intialData();
  changeCat(int val, String catval);
  getItems(String categoriesId);
  yachetDetailsModel(
    YachetDetailsModel yachetDetailsModel,
  );
}

class CategoriesPageControllerImp extends CategoriesPageController {
  List categories = [];
  String? categoryid;
  int? selectedcategory;

  CategoriesIdData categoriesIdData = CategoriesIdData(Get.find());

  List data = [];

  late StatusRequest statusRequest;
  SharedService sharedService = Get.find();

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    categories = Get.arguments["categories"];
    selectedcategory = Get.arguments['selectedcategory'];
    categoryid = Get.arguments['categoryid'];
    getItems(categoryid!);
  }

  @override
  changeCat(val, catval) {
    selectedcategory = val;
    categoryid = catval;
    getItems(categoryid!);
    update();
  }

  @override
  getItems(categoriesId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await categoriesIdData.getData(
      categoriesId,
    );
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  yachetDetailsModel(
    yachetDetailsModel,
  ) {
    // getItems(cityid!);
    Get.toNamed(AppRoute.itemDetailsPage, arguments: {
      'detailsModel': yachetDetailsModel,
    });
  }
}
