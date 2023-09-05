import 'package:boat_booking/data/datasource/wallet/wallet_data.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/domain/model/wallet_model.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class WalletController extends GetxController {
  getWallet();
}

class WalletControllerImp extends WalletController {
  StatusRequest statusRequest = StatusRequest.none;

  List wallet = [];
  List<WalletModel> walletModel = [];

  WalletData walletData = WalletData(Get.find());

  SharedService sharedService = Get.find();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  Future<void> onRefresh() async {
    getWallet();
    await Future.delayed(const Duration(seconds: 3));
    refreshController.refreshCompleted();
  }

  @override
  getWallet() async {
    walletModel.clear();

    statusRequest = StatusRequest.loading;
    var response = await walletData
        .getData(sharedService.sharedPref.getString("user_id")!);
    if (kDebugMode) {
      print("=============================== Controller $response ");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        wallet.addAll(response['data']);
        List dataresponse = response['data'];
        myHive!.put('wallet', response['data']);
        walletModel.addAll(dataresponse.map((e) => WalletModel.fromJson(e)));
      } else {
        // statusRequest = StatusRequest.failure;
        // CustomSnackWidget.appErrorSnack(
        //     Get.context!, "هناك خطا من فضلك حاول مرة اخري");
      }
    }
    update();
  }

  @override
  void onInit() {
    getWallet();
    super.onInit();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  // @override
  // ordersDetailsPage(orderModel, yachetDetailsModel) {
  //   Get.toNamed(AppRoute.bookingDetailsPage, arguments: {
  //     'orderModel': orderModel,
  //     'detailsModel': yachetDetailsModel,
  //   });
  // }
}
