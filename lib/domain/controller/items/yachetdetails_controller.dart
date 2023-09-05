import 'package:boat_booking/data/datasource/booking/bookingitem_data.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/domain/model/yachetdetails_model.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_buttonshow.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_snackwidget.dart';
import 'package:boat_booking/screens/widgets/consts/widget/success_widget.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class YachetDetailesController extends GetxController {
//  goToBooking(String hoteiId, String userId, hotelsViewModel);
  // launchURL();
  bookedItem();
}

class YachetDetailesControllerImp extends YachetDetailesController {
  SharedService sharedService = Get.find();

  late YachetDetailsModel yachetDetailsModel;
  //late StatusRequest statusRequest;
  late List<String> times;
  // ReviewControllerImp reviewControllerImp = Get.put(ReviewControllerImp());
  // RelatedControllerImp relatedControllerImp = Get.put(RelatedControllerImp());

  RxString selectedTime = RxString('');
  Rx<DateTime> selectedDate = Rx<DateTime>(DateTime.now());
  void saveSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

// 2. دالة لحفظ الوقت المحدد
  void saveSelectedTime(String time) {
    selectedTime.value = time;
    update();
  }

  intialData() {
    yachetDetailsModel = Get.arguments['detailsModel'];
    times = yachetDetailsModel.itemTimeAvailable!.split(',');
  }

  // Future<void> launchURL() async {
  //   if (!await launchUrl(Uri.parse(hotelsViewModel.hotelLocation!))) {
  //     throw Exception('Could not launch location');
  //   }
  // }

  // goToBooking(hoteiId, userId, hotelsViewModel) {
  //   Get.toNamed(AppRoute.orderUserPage, arguments: {
  //     'hotel_id': hoteiId,
  //     'oner_id': userId,
  //     'detailsModel': hotelsViewModel
  //   });
  // }

//++=========================BOOKIngCOde
  late TextEditingController orderMSG;

  BookingItemData bookingItemData = BookingItemData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  @override
  bookedItem() async {
    if (selectedTime.value == "") {
      CustomSnackWidget.appErrorSnack(Get.context!, "من فضلك اختر وقت للحجز");
    }
    if (formstate.currentState!.validate() && selectedTime.value != "") {
      statusRequest = StatusRequest.loading;
      update();
      var response = await bookingItemData.postdata(
          yachetDetailsModel.itemPrice!,
          yachetDetailsModel.itemTotalPeople!,
          selectedDate.value.toString(),
          selectedTime.toString(),
          orderMSG.text,
          "discount",
          yachetDetailsModel.itemId!,
          sharedService.sharedPref.getString("user_id")!,
          yachetDetailsModel.itemOnerId!,
          yachetDetailsModel.itemImage!);
      if (kDebugMode) {
        print("=============================== Controller $response ");
      }
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Navigator.maybePop(Get.context!);
          CustomBottomSheet.show(
              Get.context!,
              const SuccessWidget(
                title: "تم الحجز  بنجاح",
                captiontitle: "في انتظار موافقة المشرف",
              ),
              0.6);
        } else {
          CustomSnackWidget.appErrorSnack(
              Get.context!, "هناك خطا فالبيانات من فضلك حاول مرة اخري");
        }

        update();
      } else {
        CustomSnackWidget.appErrorSnack(
            Get.context!, "هناك خطا من فضلك حاول مرة اخري");
      }
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    // reviewControllerImp.getReview(hotelsViewModel.hotelId!);
    // relatedControllerImp.getRelatedData(
    //     hotelsViewModel.cityId!, hotelsViewModel.hotelUserPost!);
    orderMSG = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    orderMSG.dispose();
    super.dispose();
  }
}
