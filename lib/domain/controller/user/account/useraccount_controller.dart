import 'package:boat_booking/data/datasource/user/account/useraccount_data.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/domain/model/useraccount_model.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_snackwidget.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class UserAccountController extends GetxController {
  getAccontDataAndView();
  //goToEditUser(detailsModel);
  // goToViewShowRequest();
}

class UserAccountControllerImp extends UserAccountController {
  StatusRequest statusRequest = StatusRequest.none;
  UserAccountData userAccountData = UserAccountData(Get.find());
  List userAccount = [];
  List<UserAccountModel> data = [];
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  Future<void> onRefresh() async {
    getAccontDataAndView();
    await Future.delayed(const Duration(seconds: 2));
    refreshController.refreshCompleted();
  }

  @override
  getAccontDataAndView() async {
    data.clear();

    statusRequest = StatusRequest.loading;
    var response = await userAccountData.getdata();
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        userAccount.addAll(response['data']);
        List dataresponse = response['data'];

        data.addAll(dataresponse.map((e) => UserAccountModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
        CustomSnackWidget.appErrorSnack(Get.context!, 'هناك خطا حاول مرة اخري');
      }
    }
    update();
  }

  // @override
  // goToViewShowRequest() {}
  // @override
  // goToEditUser(detailsModel) {
  //   Get.toNamed(AppRoute.editAccountPage,
  //       arguments: {'detailsModel': detailsModel});
  // }

  @override
  void onInit() {
    getAccontDataAndView();
    super.onInit();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}
