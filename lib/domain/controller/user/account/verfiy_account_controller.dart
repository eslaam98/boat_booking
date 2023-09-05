import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_snackwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerfiyAccountController extends GetxController {
  sendSMS();
}

class VerfiyAccountControllerImp extends VerfiyAccountController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  var isCodeSent = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  // State variable to keep track of the verification ID sent by Firebase
  var verificationId = ''.obs;

  late TextEditingController phone;

  @override
  void sendSMS() async {
    // try {

    await auth.verifyPhoneNumber(
      phoneNumber: '${phone.text}',
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
        auth.signInWithCredential(phoneAuthCredential);
      },
      // timeout: const Duration(seconds: 60),
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('phoneauth is an ---- The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        isCodeSent.value = true;
        verificationId = verificationId;
        resendToken = resendToken;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
    );
//  CustomBottomSheet.show(Get.context!, const VerifyPhonePage(), 0.5);
    // } catch (e) {
    //   print('Error sending verification code: $e');
    // }
  }

  Future<void> verifyCode(String code) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId.value, smsCode: code);
      await FirebaseAuth.instance.signInWithCredential(credential);
      print('Phone number verified successfully.');
      Navigator.maybePop(Get.context!);
      CustomSnackWidget.appSuccessSnack(
          Get.context!, "Phone number verified successfully");
    } catch (e) {
      print('Error verifying verification code: $e');
    }
  }

  @override
  void onInit() {
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }
}
