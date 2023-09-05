import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/data/datasource/user/auth/login.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_snackwidget.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

abstract class LoginController extends GetxController {
  login();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;
  SharedService sharedService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final Icon visible = const Icon(Iconsax.eye);
  final Icon visibleOff = const Icon(Iconsax.eye_slash);
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      if (kDebugMode) {
        print("=============================== Controller $response ");
      }
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          sharedService.sharedPref
              .setString('user_id', response['data']['user_id']);

          sharedService.sharedPref
              .setString('username', response['data']['username']);
          sharedService.sharedPref
              .setString('email', response['data']['user_email']);
          sharedService.sharedPref.setString('user_password', password.text);
          sharedService.sharedPref.setString('step', '2');
          ////========Save=Data=In=Hive========
          myHive!.put('userData', response['data']);
          //=====================================
          String userID = sharedService.sharedPref.getString('user_id')!;
          FirebaseMessaging.instance.subscribeToTopic('users');
          FirebaseMessaging.instance.subscribeToTopic('users$userID');
          Get.offNamed(AppRoute.splashScreenPage);
        } else {
          CustomSnackWidget.appErrorSnack(
              Get.context!, "هناك خطا فالبيانات من فضلك حاول مرة اخري");
        }
      }
      update();
    } else {
      // Get.offNamed(AppRoute.loginPage);
      CustomSnackWidget.appErrorSnack(
          Get.context!, "هناك خطا من فضلك حاول مرة اخري");
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
