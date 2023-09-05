import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/data/datasource/user/auth/verfiy_code_singup_data.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_snackwidget.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verfiyCodeSignUp);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());

  String? email;

  StatusRequest statusRequest = StatusRequest.none;
  @override
  checkCode() {}
  @override
  goToSuccessSignUp(verfiyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verfiyCodeSignUpData.postdata(email!, verfiyCodeSignUp);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.loginPage);
        // CustomSnackWidget.appSuccessSnack(
        //     Get.context!, 'Success SignUp now you can Login');
      } else {
        CustomSnackWidget.appErrorSnack(Get.context!, "الكود خاطيء");

        // Get.offNamed(AppRoute.verifyCodeSignUpPage,
        //     arguments: {"email": email});
      }
    }
    update();
  }

  resendC() {
    verfiyCodeSignUpData.resendCode(email!);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
