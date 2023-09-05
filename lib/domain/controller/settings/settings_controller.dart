import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController {
  goToEditUser(detailsModel);
  goToChangeLanguage();
  goToLogoutPage();
  // getAccontDataAndView();
}

bool isDarkModeEnabled = sharedService.sharedPref.getBool('isDark') ?? false;

class SettingsControllerImp extends SettingsController {
  StatusRequest statusRequest = StatusRequest.none;
  // GetUserData getUserData = GetUserData(Get.find());
  // List userAccount = [];
  // List<AccountModel> data = [];

  // @override
  // getAccontDataAndView() async {
  //   userAccount.clear();

  //   statusRequest = StatusRequest.loading;
  //   var response = await getUserData.getdata();
  //   if (kDebugMode) {
  //     print("=============================== Controller $response ");
  //   }
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       userAccount.addAll(response['data']);
  //       List dataresponse = response['data'];

  //       data.addAll(dataresponse.map((e) => AccountModel.fromJson(e)));

  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  @override
  goToChangeLanguage() {
//    Get.toNamed(AppRoute.chooseLanguage);
  }

  @override
  goToEditUser(detailsModel) {
    // Get.toNamed(AppRoute.editAccountPage,
    //     arguments: {'detailsModel': detailsModel});
  }

  @override
  goToLogoutPage() {
    // logOutDialogWidget(Get.context!);
  }

  @override
  void onInit() {
    //  getAccontDataAndView();
    super.onInit();
  }
}
