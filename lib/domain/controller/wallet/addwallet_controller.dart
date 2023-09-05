import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/data/datasource/wallet/addwallet_data.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_buttonshow.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_snackwidget.dart';
import 'package:boat_booking/screens/widgets/consts/widget/success_widget.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddWalletController extends GetxController {
  addWallet();
}

class AddWalletControllerImp extends AddWalletController {
  AddWalletData addWalletData = AddWalletData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController walletPrice;

  late TextEditingController walletDetails;

  SharedService sharedService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  @override
  addWallet() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addWalletData.postdata(walletPrice.text,
          sharedService.sharedPref.getString("user_id")!, walletDetails.text);
      if (kDebugMode) {
        print("=============================== Controller $response ");
      }
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // Navigator.maybePop(Get.context!);
          CustomBottomSheet.show(
              Get.context!,
              const SuccessWidget(
                title: "تم اضافة الرصيد بنجاح",
                captiontitle: "نأمل ان نكون دائما عند حسن ظنكم",
              ),
              0.6);
        } else {
          CustomSnackWidget.appErrorSnack(
              Get.context!, "هناك خطا فالبيانات من فضلك حاول مرة اخري");
        }
      }
      update();
    } else {
      Get.offNamed(AppRoute.loginPage);
      CustomSnackWidget.appErrorSnack(
          Get.context!, "هناك خطا من فضلك حاول مرة اخري");
    }
    update();
  }

  @override
  void onInit() {
    walletPrice = TextEditingController();
    walletDetails = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    walletPrice.dispose();
    walletDetails.dispose();
    super.dispose();
  }
}
