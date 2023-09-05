import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/domain/model/order_model.dart';
import 'package:boat_booking/domain/model/yachetdetails_model.dart';

import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:get/get.dart';

abstract class OrderDetailsController extends GetxController {}

class OrderDetailsControllerImp extends OrderDetailsController {
  SharedService sharedService = Get.find();

  late OrderModel orderModel;
  //late StatusRequest statusRequest;
  late YachetDetailsModel yachetDetailsModel;

  goToDetailsPage(
    yachetDetailsModel,
  ) {
    Get.toNamed(AppRoute.itemDetailsPage,
        arguments: {'detailsModel': yachetDetailsModel});
  }

  intialData() {
    orderModel = Get.arguments['orderModel'];
    yachetDetailsModel = Get.arguments['detailsModel'];
  }

  @override
  void onInit() {
    intialData();

    super.onInit();
  }
}
