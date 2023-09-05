import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/data/datasource/user/forgetpassword/reset_password.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_snackwidget.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  final Icon visible = const Icon(Iconsax.eye);
  final Icon visibleOff = const Icon(Iconsax.eye_slash);
  late TextEditingController password;
  late TextEditingController repassword;
  bool isshowpassword = true;
  bool isshowpasswordtwo = true;
  showPasswordtwo() {
    isshowpasswordtwo = isshowpasswordtwo == true ? false : true;

    update();
  }

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;

    update();
  }

  String? email;
  SharedService sharedService = Get.find();

  @override
  resetpassword() {}

  @override
  goToSuccessResetPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "warning", middleText: "Password Not Match");
    }

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postdata(email!, password.text);
      if (kDebugMode) {
        print("=============================== Controller $response ");
      }
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          sharedService.sharedPref.setString('password', password.text);
          // data.addAll(response['data']);
          Get.offAllNamed(AppRoute.loginPage);
          CustomSnackWidget.appSuccessSnack(
              Get.context!, 'تم اضافة كلمة السر الجديدة بنجاح');
        } else {
          CustomSnackWidget.appErrorSnack(
              Get.context!, 'من فضلك حاول مرة اخري');
        }
      }
      update();
    } else {
      if (kDebugMode) {
        print("Not Valid");
      }
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
