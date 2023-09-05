import 'package:boat_booking/data/datasource/user/account/changepass_data.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_snackwidget.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

abstract class ChangePaasController extends GetxController {
  changePassword();
}

class ChangePaasControllerImp extends ChangePaasController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController reNewPassword = TextEditingController();

  StatusRequest statusRequest = StatusRequest.none;
/////////

  ChangePassData changePassData = ChangePassData(Get.find());
  bool isshowpassword = true;
  final Icon visible = const Icon(Iconsax.eye);
  final Icon visibleOff = const Icon(Iconsax.eye_slash);

  bool isshowpasswordTow = true;

  ///-----------------
  showPasswordTow() {
    isshowpasswordTow = isshowpasswordTow == true ? false : true;
    update();
  }

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  bool isshowpasswordThree = true;

  ///-----------------
  showPasswordThree() {
    isshowpasswordThree = isshowpasswordThree == true ? false : true;
    update();
  }

  @override
  changePassword() async {
    if (newPassword.text != reNewPassword.text) {
      return Get.defaultDialog(
          title: "warning", middleText: "Password Not Match");
    }
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await changePassData.postdata(oldPassword.text,
          newPassword.text, sharedService.sharedPref.getString("user_id")!);

      if (kDebugMode) {
        print("======= Controller $response ");
      }
      update();
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Navigator.maybePop(Get.context!);
          CustomSnackWidget.appSuccessSnack(
              Get.context!, 'تم تعديل البيانات بنجاح');
        } else {
          CustomSnackWidget.appErrorSnack(
              Get.context!, 'فشل في تعديل البيانات');

          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      CustomSnackWidget.appErrorSnack(Get.context!, 'فشل في تعديل البيانات');
    }
    update();
  }

  // intialData() {
  //   o.text = userAccountModel.username!;
  //   phone.text = userAccountModel.userPhone!;
  //   // selectedOption2.value = accountModel.userCountry!;
  // }

  @override
  void onInit() {
    oldPassword = TextEditingController();
    newPassword = TextEditingController();
    reNewPassword = TextEditingController();

    // intialData();
    super.onInit();
  }

  @override
  void dispose() {
    oldPassword.dispose();
    newPassword.dispose();
    reNewPassword.dispose();

    super.dispose();
  }
}
