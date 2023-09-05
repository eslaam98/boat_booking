import 'package:boat_booking/domain/model/booking_model.dart';
import 'package:boat_booking/domain/model/yachetdetails_model.dart';

import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:get/get.dart';

abstract class SafariDetailesController extends GetxController {}

class SafariDetailesControllerImp extends SafariDetailesController {
  SharedService sharedService = Get.find();

  late YachetDetailsModel yachetDetailsModel;
  late BookingModel bookingModel;

  intialData() {
    yachetDetailsModel = Get.arguments['detailsModel'];
    //bookingModel = Get.arguments['bookedModel'];
  }

  @override
  void onInit() {
    intialData();

    super.onInit();
  }
}
