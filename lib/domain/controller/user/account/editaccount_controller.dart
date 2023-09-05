import 'dart:io';

import 'package:boat_booking/data/datasource/user/account/edituser_data.dart';
import 'package:boat_booking/data/handling/handling_data.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_snackwidget.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

abstract class EditAccountController extends GetxController {
  editAccount();
  selectImage();
}

class EditAccountControllerImp extends EditAccountController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
/////////

  EditUserData editUserData = EditUserData(Get.find());

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
    if (cover != null) {
      imagename = cover.name;
      var f = await cover.readAsBytes();
      webimage = f;
      image = webimage;
      update();
    } else {}
  }

  @override
  editAccount() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response;
      if (imageUserProfile == null) {
        response = await editUserData.postdataWithoutImage(
            sharedService.sharedPref.getString("user_id")!,
            username.text,
            phone.text,
            myHive!.get('userData')['user_image']);
      } else {
        response = await editUserData.postdata(
            sharedService.sharedPref.getString("user_id")!,
            username.text,
            phone.text,
            imagename!,
            imageUserProfile);
      }

      if (kDebugMode) {
        print("======= Controller $response ");
      }
      update();
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
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

  intialData() {
    username.text = myHive!.get('userData')['username'];
    phone.text = myHive!.get('userData')['user_phone'];
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    intialData();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
