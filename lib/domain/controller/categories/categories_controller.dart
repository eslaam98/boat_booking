import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/data/datasource/categories/categories_data.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class CategoriesController extends GetxController {
  getCategories();
  goToCategoriesScreen(
      List categories, int selectedcategory, String categoryid);
}

class CategoriesControllerImp extends CategoriesController {
  List categories = [];
  String? categoryId;
  int? selectedcategory;

  CategoriesData categoriesData = CategoriesData(Get.find());

  late StatusRequest statusRequest;
  SharedService sharedService = Get.find();
  // HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  List yachet = [];
  Future<void> onRefresh() async {
    getCategories();
    await Future.delayed(const Duration(seconds: 3));
    refreshController.refreshCompleted();
  }

  @override
  getCategories() async {
    categories.clear();
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.getData(
        //  categoriesId,
        );
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        categories.addAll(response['data']);

        // homeControllerImp.getdata();
        print(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
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
  void onInit() {
    getCategories();
    super.onInit();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}
