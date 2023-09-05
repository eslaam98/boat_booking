import 'dart:io';

import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/data/datasource/user/auth/signup_data.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_snackwidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
  selectImage();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController repassword;

  StatusRequest statusRequest = StatusRequest.none;

  SignupData signupData = SignupData(Get.find());
  List data = [];
  bool isshowpassword = true;
  final Icon visible = const Icon(Iconsax.eye);
  final Icon visibleOff = const Icon(Iconsax.eye_slash);
  bool isshowpasswordtwo = true;
  showPasswordtwo() {
    isshowpasswordtwo = isshowpasswordtwo == true ? false : true;

    update();
  }

  ///pickimage==========
  ///
  List<int> image = [];
  File? imageUserProfile;

  String? imagename;
  Uint8List webimage = Uint8List(8);
  final ImagePicker pickerimage = ImagePicker();
  @override
  Future<void> selectImage() async {
    XFile? cover = await pickerimage.pickImage(source: ImageSource.gallery);
    imageUserProfile = File(cover!.path);
    // ignore: unnecessary_null_comparison
    if (cover != null) {
      imagename = cover.name;
      var f = await cover.readAsBytes();
      webimage = f;
      image = webimage;
      update();
    } else {}
  }

  bool policyandrolles = false;
  policyandrollesShow() {
    policyandrolles = policyandrolles == false ? true : false;
    update();
  }

  ///-----------------

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  signUp() async {
    // if () {
    //   return Get.defaultDialog(
    //       title: "warning", middleText: "كلمة السر غير متطابقة");
    // }
    if (formstate.currentState!.validate() &&
            //   password.text != repassword.text &&
            imagename != null
        //policyandrolles == false
        ) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await signupData.postdata(username.text, email.text,
          phone.text, password.text, imagename!, imageUserProfile);
      if (kDebugMode) {
        print("======= Controller $response ");
      }
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verifyCodeSignUp,
              arguments: {"email": email.text});
        } else {
          Navigator.maybePop(Get.context!);
          //  Get.offNamed(AppRoute.signUpPage);
          CustomSnackWidget.appErrorSnack(
              Get.context!, 'من فضلك حاول مرة اخري');

          //  statusRequest = StatusRequest.none;
        }
      }
    } else {
      CustomSnackWidget.appErrorSnack(Get.context!, 'من فضلك حاول مرة اخري');
      //  Get.offNamed(AppRoute.signUpPage);
    }
    update();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.loginPage);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
