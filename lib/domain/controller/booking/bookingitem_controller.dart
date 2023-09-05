// import 'package:boat_booking/config/router/routes.dart';
// import 'package:boat_booking/data/datasource/booking/bookingitem_data.dart';
// import 'package:boat_booking/data/datasource/suggest/addsuggest_data.dart';
// import 'package:boat_booking/data/handling/handling_data.dart';
// import 'package:boat_booking/data/handling/status_request.dart';
// import 'package:boat_booking/screens/widgets/consts/widget/custom_buttonshow.dart';
// import 'package:boat_booking/screens/widgets/consts/widget/custom_snackwidget.dart';
// import 'package:boat_booking/screens/widgets/consts/widget/success_widget.dart';
// import 'package:boat_booking/utils/constants/shared_service.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// abstract class BookingItemController extends GetxController {
//   bookedItem();
// }

// class BookingItemControllerImp extends BookingItemController {
//   BookingItemData bookingItemData = BookingItemData(Get.find());

//   GlobalKey<FormState> formstate = GlobalKey<FormState>();
//   late TextEditingController suggestUsername;
//   late TextEditingController suggestUserPhone;

//   late TextEditingController suggestType;
//   late TextEditingController suggestDesc;

//   SharedService sharedService = Get.find();
//   StatusRequest statusRequest = StatusRequest.none;

//   @override
//   bookedItem() async {
//     if (formstate.currentState!.validate()) {
//       statusRequest = StatusRequest.loading;
//       update();
//       var response = await bookingItemData.postdata(
         
          
//           );
//       if (kDebugMode) {
//         print("=============================== Controller $response ");
//       }
//       statusRequest = handlingData(response);
//       if (StatusRequest.success == statusRequest) {
//         if (response['status'] == "success") {
//           Navigator.maybePop(Get.context!);
//           CustomBottomSheet.show(
//               Get.context!,
//               const SuccessWidget(
//                 title: "تم ارسال الرسالة بنجاح",
//                 captiontitle: "نأمل ان نكون دائما عند حسن ظنكم",
//               ),
//               0.6);
//         } else {
//           CustomSnackWidget.appErrorSnack(
//               Get.context!, "هناك خطا فالبيانات من فضلك حاول مرة اخري");
//         }
//       }
//       update();
//     } else {
//       Get.offNamed(AppRoute.loginPage);
//       CustomSnackWidget.appErrorSnack(
//           Get.context!, "هناك خطا من فضلك حاول مرة اخري");
//     }
//     update();
//   }

//   @override
//   void onInit() {
//     suggestUsername = TextEditingController();
//     suggestUserPhone = TextEditingController();
//     suggestType = TextEditingController();
//     suggestDesc = TextEditingController();

//     super.onInit();
//   }

//   @override
//   void dispose() {
//     suggestUsername.dispose();
//     suggestUserPhone.dispose();
//     suggestType.dispose();
//     suggestDesc.dispose();
//     super.dispose();
//   }
// }
