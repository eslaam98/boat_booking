import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:get/get.dart';

translateNameArEnDatabase(nameAr, nameEn) {
  SharedService sharedService = Get.find();
  if (sharedService.sharedPref.getString('language') == 'en') {
    return nameEn;
  } else {
    return nameAr;
  }
}
