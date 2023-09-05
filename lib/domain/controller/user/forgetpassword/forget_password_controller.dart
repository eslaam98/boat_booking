import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/data/datasource/user/forgetpassword/check_email.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_snackwidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController email;

  @override
  checkemail() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postdata(email.text);
      if (kDebugMode) {
        print("=============================== Controller $response ");
      }
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verifyCode, arguments: {"email": email.text});
          CustomSnackWidget.appSuccessSnack(
              Get.context!, 'تم العثور علي البريد بنجاح');
        } else {
          CustomSnackWidget.appErrorSnack(
              Get.context!, 'لم يتم التعرف علي البريد');
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
